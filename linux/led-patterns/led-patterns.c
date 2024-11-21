#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/mod_devicetable.h>
#include <linux/io.h>
#include <linux/mutex.h>
#include <linux/miscdevice.h>
#include <linux/types.h>
#include <linux/fs.h>

#define HPS_LED_CONTROL_OFFSET 0x0
#define BASE_PERIOD_OFFSET 0x4
#define LED_REG_OFFSET 0x8
#define SPAN 16


// Private led patterns device structure 
struct led_patterns_dev {
    void __iomem *base_addr;
    void __iomem *hps_led_control;
    void __iomem *base_period;
    void __iomem *led_reg;
    struct miscdevice miscdev;
    struct mutex lock;
};

// Read method for the led_patterns char device
static ssize_t led_patterns_read(struct file *file, char __user *buf,
    size_t count, loff_t *offset)
{
    size_t ret;
    u32 val;

    // Get device private date
    struct led_patterns_dev *priv = container_of(file->private_data,
                                struct led_patterns_dev, miscdev);

    if (*offset < 0) {
        return -EINVAL;
    }
    if (*offset >= SPAN) {
        return 0;
    }
    if((*offset % 0x4) != 0) {
        pr_warn("led_patterns_read: unaligned accsess\n");
        return -EFAULT;
    }

    val = ioread32(priv->base_addr + *offset);

    ret = copy_to_user(buf, &val, sizeof(val));
    if (ret == sizeof(val)) {
        pr_warn("led_patterns_read: nothing copied\n");
        return -EFAULT;
    }

    *offset = *offset + sizeof(val);

    return sizeof(val);
};

// Write  method for the led_patterns char device
static ssize_t led_patterns_write(struct file *file, const char __user *buf,
    size_t count, loff_t *offset)
{
    size_t ret;
    u32 val;

    // Get device private date
    struct led_patterns_dev *priv = container_of(file->private_data,
                                struct led_patterns_dev, miscdev);

    if (*offset < 0) {
        return -EINVAL;
    }
    if (*offset >= SPAN) {
        return 0;
    }
    if((*offset % 0x4) != 0) {
        pr_warn("led_patterns_write: unaligned accsess\n");
        return -EFAULT;
    }

    mutex_lock(&priv->lock);

    ret = copy_from_user(&val, buf,  sizeof(val));
    if (ret != sizeof(val)) {
        iowrite32(val, priv->base_addr + *offset);

        *offset = *offset + sizeof(val);

        ret = sizeof(val);
    }
    else {
        pr_warn("led_patterns_write: nothing copied from user space\n");
        ret = -EFAULT;
    }

    mutex_unlock(&priv->lock);
    return ret;
}

// Led patterns file operations structure
static const struct file_operations led_patterns_fops = {
    .owner = THIS_MODULE,
    .read = led_patterns_read,
    .write = led_patterns_write,
    .llseek = default_llseek,
};

// Initilize led patterns on device tree
static int led_patterns_probe(struct platform_device *pdev)
{
    size_t ret;
    struct led_patterns_dev *priv;
    
    // Allocate memory for led patterns device
    priv = devm_kzalloc(&pdev->dev, sizeof(struct led_patterns_dev),
                        GFP_KERNEL);
    if (!priv) {
        pr_err("Failed to allocate memory\n");
        return -ENOMEM;
    }

    // Request to remap device memory region
    priv->base_addr = devm_platform_ioremap_resource(pdev, 0);
    if (IS_ERR(priv->base_addr)) {
        pr_err("Failed to request/remap platform device resource\n");
        return PTR_ERR(priv->base_addr);
    }
    
    // Set memory adresses for each register
    priv->hps_led_control = priv->base_addr + HPS_LED_CONTROL_OFFSET;
    priv->base_period = priv->base_addr + BASE_PERIOD_OFFSET;
    priv->led_reg = priv->base_addr + LED_REG_OFFSET;

    // Enable software-control mode and turn on all leds
    iowrite32(1, priv->hps_led_control);
    iowrite32(0xff, priv->led_reg);
    
    // Initilize the misc device parameters
    priv->miscdev.minor = MISC_DYNAMIC_MINOR;
    priv->miscdev.name = "led_patterns";
    priv->miscdev.fops = &led_patterns_fops;
    priv->miscdev.parent = &pdev->dev;

    // Register the misc device; creates a char at /dev/led_patterns
    ret = misc_register(&priv->miscdev);
    if (ret) {
        pr_err("Failed to register misc device");
        return ret;
    }

    // Attach led patterns private data to the platform device struct
    platform_set_drvdata(pdev, priv);

    pr_info("led_patterns_probe successful\n");

    return 0;
}

// Call to remove led patterns form device tree
static int led_patterns_remove(struct platform_device *pdev)
{
    // Get the led patterns private data from platform device
    struct led_patterns_dev *priv = platform_get_drvdata(pdev);

    // Disable software control mode
    iowrite32(0, priv->hps_led_control);
    
    // Deregister the misc device and remove the /dev/led_patterns file
    misc_deregister(&priv->miscdev);

    pr_info("led_patterns_remove successful\n");

    return 0;
}

// Define the compatibility property
static const struct of_device_id led_patterns_of_match[] = {
    { .compatible = "adsd,led_patterns", },
    { }
};
MODULE_DEVICE_TABLE(of, led_patterns_of_match);

// Platfrom device struct for led patterns driver
static struct platform_driver led_patterns_driver = {
    .probe = led_patterns_probe,
    .remove = led_patterns_remove,
    .driver = {
        .owner = THIS_MODULE,
        .name = "led_patterns",
        .of_match_table = led_patterns_of_match,
    },
};

module_platform_driver(led_patterns_driver);

// Info
MODULE_LICENSE("Dual MIT/GPL");
MODULE_AUTHOR("Peter Buckley");
MODULE_DESCRIPTION("led_patterns driver");


