Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506F22E2C5
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jul 2020 23:38:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A2AB665C5
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jul 2020 21:38:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6B0C36661F; Sun, 26 Jul 2020 21:38:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MIME_HTML_MOSTLY,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B2B07665E9;
	Sun, 26 Jul 2020 21:33:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8F65E60AAB
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 17:37:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7117966539; Sun, 26 Jul 2020 17:37:38 +0000 (UTC)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 by lists.linaro.org (Postfix) with ESMTPS id EDF7360AAB
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 17:37:31 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id q15so4719170uap.4
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 10:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nDeLnVg28osR+PHIvDDiJKMIt5U0oidmoPj/FKeUvBk=;
 b=fUqKaOa5bLraMjKFlX2I6oUjLWzGeiPP6xMpjXby5q0WrrxrzjGR7ueIkVN+KDZay5
 7LawOOLFzptc2a40fCkdCooTv3Q5NAtfnRPbv4xFWX8bIi0+ymnpHF9iXZQPnpBbdgMt
 JUWNsO44TjBUYDC8pxwFsfxic85gcd6LG8IjlailK0iwJhElMM6nM7AIuZDkcJmrHbuh
 02hW4Ws1XytwSJmCZmLg0g8HV4LrYuUb39l25u/VAKxrFqy74aSZjDP4MO2GbUsXpSG1
 v3GuDCSaoI/HiW3wqQHoltiWTYi8e0VVX4neG1mM40XO4jwHp+vvyoBsiYjU/9Kf2672
 npZg==
X-Gm-Message-State: AOAM533TlhAPBnlIl5OQbPGcZQ1WXhRNx60qimWFuGM9HDM4w/w89xjy
 D2oF/9RocWZ3+eJ55GoGzpaMz+4/2Iv/pi3+V6k=
X-Google-Smtp-Source: ABdhPJzcqf9hF5rUzqkVe9+wKgLWn9RxcpmVxFOJYYXKZvCKPnNmjhEZtEXAE+XeT+iijdLSZlIol6E1IIdrXiDtbZk=
X-Received: by 2002:ab0:284d:: with SMTP id c13mr13997109uaq.42.1595785051230; 
 Sun, 26 Jul 2020 10:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200724120637.GA427284@vaishnav-VirtualBox>
 <15cab987-6eaa-9137-0f70-4735b3fea87f@linaro.org>
In-Reply-To: <15cab987-6eaa-9137-0f70-4735b3fea87f@linaro.org>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Sun, 26 Jul 2020 13:37:20 -0400
Message-ID: <CA+T6QPmJW6dVbcD07oj6YcxC_LRgLzCsdOLy03AG1bti68DkLw@mail.gmail.com>
To: Alex Elder <elder@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 26 Jul 2020 21:33:22 +0000
Cc: rajkovic@mikroe.com, robh@kernel.org, elder@kernel.org, arnd@arndb.de,
 drew@beagleboard.org, johan@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, Vaishnav M A <vaishnav@beagleboard.org>,
 mchehab+huawei@kernel.org, robertcnelson@beagleboard.org, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [PATCH] RFC : mikroBUS driver for add-on boards
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6861481175408736008=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============6861481175408736008==
Content-Type: multipart/alternative; boundary="0000000000001dd7d705ab5ba997"

--0000000000001dd7d705ab5ba997
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2020 at 11:04 AM Alex Elder <elder@linaro.org> wrote:

> On 7/24/20 7:06 AM, Vaishnav M A wrote:
> > Attached is a patch for the mikroBUS driver which helps to
> > instantiate an add-on board device on a mikrobus port by fetching
> > the device identifier manifest binary from an EEPROM on-board
> > the device. mikroBUS is an add-on board socket standard by
> > MikroElektronika that can be freely used by anyone
> > following the guidelines, more details and discussions on
> > the status of the driver can be found here in this eLinux wiki:
> > https://elinux.org/Mikrobus
>
> I had some other things I would comment on in this code review,
> but there are a lot of somewhat superficial things you should
> fix.  I looked at much--but not all--of this, and I'll want to
> review this again after you've fixed the simple things.  I also
> can provide more substantive feedback after I've had more time
> to digest the bigger picture of microBUS.
>
> You should assume it will take a few iterations to get to the
> point where things are shaping up for acceptance.
>
> All that said, your basic foundation looks good.
>
> > In the current state of the driver, more than 80 different
> > add-on boards have been tested on the BeagleBoard.org
> > PocketBeagle and the manifest binary is generated using the same
> > manifesto tool used to generate Greybus manifest binaries,
> > The pull request to manifesto to add new descriptors specific
> > to mikrobus is here : https://github.com/projectara/manifesto/pull/2
> > The utilization of Greybus manifest binaries here is not entirely
> > coincidental, We are evaluating ways to add mikroBUS sockets and
> > devices via Greybus expansion.
> >
> > The mikroBUS standard includes SPI, I2C, UART, PWM, ADC, GPIO
> > and power (3.3V and 5V) connections to interface common embedded
> > peripherals, There are more than 750 add-on boards ranging from
> > wireless connectivity boards to human-machine interface sensors
> > which conform to the mikroBUS standard, out of which more than 140
> > boards already have support in the Linux kernel.Today, there is no
> > mainlinesolution for enabling mikroBUS add-on boards at run-time, the
> > most straight forward method for loading drivers is to provide
> > device-tree overlay fragments at boot time, this method suffers
> > from the need to maintain a large out-of-tree database for which there
> > is need to maintain an overlay for every mikroBUS add-on board for ever=
y
> > Linux system and for every mikroBUS socket on that system.
> >
> > The mikroBUS driver tries to solve the problem by using extended versio=
n
> > of the greybus manifest to describe the add-on board device specific
> > information required by the device driver and uses it along with the
> fixed
> > port specific information to probe the specific device driver.The
> manifest
> > binary is now fetched from an I2C EEPROM over the I2C bus on the mikroB=
US
> > port(subject to change in mikroBUS v3 specification) and enumerate
> drivers
> > for the add-on devices.There is also ongoing work to define a mikroBUS
> > v3 standard in which the addon board includes a non-volatile storage to
> > store the device identifier manifest binary, once the mikroBUS v3
> standard
> > is released, the mikroBUS can be seen as a probeable bus such that the
> > kernel can discover the device on the bus at boot time.
> >
> > The driver also has a few debug SysFS interfaces for testing on add-on
> > boards without an EEPROM, these can be used in the following manner:
> > (example for mikroBUS port 1 on BeagleBoard.org PocketBeagle):
>
> You should probably use debugfs, since this is a temporary thing.
> But I guess if it's not actually upstream (and it sounds like you
> might be avoiding the need for this with EEPROM anyway) maybe
> that doesn't matter much.
>
> > printf "%b" '\x01\x00\x00\x59\x32\x17' > /sys/bus/mikrobus/add_port
> >
> > The bytes in the byte array sequence are (in order):
> >
> >       * i2c_adap_nr
> >       * spi_master_nr
> >       * serdev_ctlr_nr
> >       * rst_gpio_nr
> >       * pwm_gpio_nr
> >       * int_gpio_nr
> > * add_port sysFS entry is purely for debug and in the actual state
> > of the driver, port configuration will be loaded from a suitable
> > device tree overlay fragment.
> >
> > echo 0 > /sys/bus/mikrobus/del_port (to delete the attached port)
> > echo 1 >  /sys/class/mikrobus-port/mikrobus-0/rescan (to rescan the
> EEPROM
> > contents on the I2C bus on the mikroBUS port).
> >
> > cat board_manifest.mnfb >  /sys/class/mikrobus-port/mikrobus-0/new_devi=
ce
> > * debug interface to pass the manifest binary in case an EEPROM is abse=
nt
> > echo 0 >  /sys/class/mikrobus-port/mikrobus-0/delete_device
> > * to unload the loaded board on the mikrobus port
> >
> > These sysFS interfaces are only implemented for debug purposes and
> > in the actual implementation of the driver these will be removed and
> > the manifest binary will be fetched from the non volatile storage
> on-board
> > the device.
> >
> > The mikroBUS driver enable the mikroBUS to be a probeable bus such that
> > the kernel can discover the device and automatically load the drivers.
> > There are already several Linux platforms with mikroBUS sockets and the
> > mikroBUS driver helps to reduce the time to develop and debug
> > support for various mikroBUS add-on boards. Further, it opens up
> > the possibility for support under dynamically instantiated buses
> > such as with Greybus.
> >
> > Please let know the feedback you have on this patch or the approach use=
d.
> >
> > Thanks,
> >
> > Vaishnav M A
> >
> > Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
> > ---
> >  MAINTAINERS                               |   6 +
> >  drivers/misc/Kconfig                      |   1 +
> >  drivers/misc/Makefile                     |   1 +
> >  drivers/misc/mikrobus/Kconfig             |  16 +
> >  drivers/misc/mikrobus/Makefile            |   5 +
> >  drivers/misc/mikrobus/mikrobus_core.c     | 649 ++++++++++++++++++++++
> >  drivers/misc/mikrobus/mikrobus_core.h     | 130 +++++
> >  drivers/misc/mikrobus/mikrobus_manifest.c | 390 +++++++++++++
> >  drivers/misc/mikrobus/mikrobus_manifest.h |  21 +
> >  include/linux/greybus/greybus_manifest.h  |  53 ++
> >  10 files changed, 1272 insertions(+)
> >  create mode 100644 drivers/misc/mikrobus/Kconfig
> >  create mode 100644 drivers/misc/mikrobus/Makefile
> >  create mode 100644 drivers/misc/mikrobus/mikrobus_core.c
> >  create mode 100644 drivers/misc/mikrobus/mikrobus_core.h
> >  create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.c
> >  create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d53db30d1365..9a049746203f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11402,6 +11402,12 @@ M:   Oliver Neukum <oliver@neukum.org>
> >  S:   Maintained
> >  F:   drivers/usb/image/microtek.*
> >
> > +MIKROBUS ADDON BOARD DRIVER
> > +M:   Vaishnav M A <vaishnav@beagleboard.org>
> > +S:   Maintained
> > +W:   https://elinux.org/Mikrobus
> > +F:   drivers/misc/mikrobus/
> > +
> >  MIPS
> >  M:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> >  L:   linux-mips@vger.kernel.org
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index e1b1ba5e2b92..334f0c39d56b 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -472,4 +472,5 @@ source "drivers/misc/ocxl/Kconfig"
> >  source "drivers/misc/cardreader/Kconfig"
> >  source "drivers/misc/habanalabs/Kconfig"
> >  source "drivers/misc/uacce/Kconfig"
> > +source "drivers/misc/mikrobus/Kconfig"
> >  endmenu
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index c7bd01ac6291..45486dd77da5 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -40,6 +40,7 @@ obj-$(CONFIG_VMWARE_BALLOON)        +=3D vmw_balloon.=
o
> >  obj-$(CONFIG_PCH_PHUB)               +=3D pch_phub.o
> >  obj-y                                +=3D ti-st/
> >  obj-y                                +=3D lis3lv02d/
> > +obj-y                                +=3D mikrobus/
> >  obj-$(CONFIG_ALTERA_STAPL)   +=3Daltera-stapl/
> >  obj-$(CONFIG_INTEL_MEI)              +=3D mei/
> >  obj-$(CONFIG_VMWARE_VMCI)    +=3D vmw_vmci/
> > diff --git a/drivers/misc/mikrobus/Kconfig
> b/drivers/misc/mikrobus/Kconfig
> > new file mode 100644
> > index 000000000000..c3b93e12daad
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/Kconfig
> > @@ -0,0 +1,16 @@
> > +menuconfig MIKROBUS
> > +     tristate "Module for instantiating devices on mikroBUS ports"
> > +     help
> > +       This option enables the mikroBUS driver. mikroBUS is an add-on
> > +       board socket standard that offers maximum expandability with
> > +       the smallest number of pins. The mikroBUS driver helps in
> > +       instantiating devices on the mikroBUS port with identifier
> > +       data fetched from an EEPROM on the device, more details on
> > +       the mikroBUS driver support and discussion can be found in
> > +       this eLinux wiki : elinux.org/Mikrobus
>
> This text could be cleaned up a bit.  For example:
>         The mikroBUS driver instantiates devices on a mikroBUS port
>         described by identifying data present in device-resident EEPROM.
>
> Using well-defined terms can help a lot.  Is a physical thing that
> plugs into a microbus port called a "board"?


I agree language is important and should be consistent. There are mikroBUS
sockets and =E2=80=9Cadd-on boards=E2=80=9D.  The Mikroelektronika guys mig=
ht be able to be
more precise, but this ia my understanding.

Can a "board" present
> more than one device to the system?


It isn=E2=80=99t common with existing add-on boards, but should be allowed.

Is the EEPROM associated with
> the board, or a device?


Board.

  My point isn't that those answers belong
> here, but that having meaningful terms can help you describe things
> concisely.
>
> > +       Say Y here to enable support for this driver.
> > +
> > +       To compile this code as a module, chose M here: the module
> > +       will be called mikrobus.ko
> > diff --git a/drivers/misc/mikrobus/Makefile
> b/drivers/misc/mikrobus/Makefile
> > new file mode 100644
> > index 000000000000..1f80ed4064d8
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/Makefile
> > @@ -0,0 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# mikroBUS Core
> > +
> > +mikrobus-y :=3D        mikrobus_core.o mikrobus_manifest.o
> > +obj-$(CONFIG_MIKROBUS) +=3D mikrobus.o
> > \ No newline at end of file
> > diff --git a/drivers/misc/mikrobus/mikrobus_core.c
> b/drivers/misc/mikrobus/mikrobus_core.c
> > new file mode 100644
> > index 000000000000..78c96c637632
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/mikrobus_core.c
> > @@ -0,0 +1,649 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * mikroBUS driver for instantiating add-on
> > + * board devices with an identifier EEPROM
> > + *
> > + * Copyright 2020 Vaishnav M A, BeagleBoard.org Foundation.
> > + */
> > +
> > +#define pr_fmt(fmt) "mikrobus: " fmt
> > +
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/idr.h>
> > +#include <linux/init.h>
> > +#include <linux/jump_label.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/mutex.h>
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/i2c.h>
> > +#include <linux/gpio.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/serdev.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
> > +
> > +#include "mikrobus_core.h"
> > +#include "mikrobus_manifest.h"
> > +
> > +#define ATMEL_24C32_I2C_ADDR 0x57
>
> I'm just getting started looking through this, so maybe I'll find
> out soon. But why is this ATMEL I2C address needed in the core code?
>
> > +static DEFINE_IDR(mikrobus_port_idr);
> > +static struct class_compat *mikrobus_port_compat_class;
> > +static bool is_registered;
> > +
> > +static ssize_t add_port_store(struct bus_type *bt, const char *buf,
> > +                           size_t count)
> > +{
> > +     struct mikrobus_port_config *cfg;
> > +
> > +     if (count < sizeof(*cfg)) {
>
> Perhaps this should be:
>         if (count !=3D sizeof(*cfg)) {
>
> > +             pr_err("add_port: incorrect config data received: %s\n",
> buf);
>
> I don't think you need to include "add_port: ".
>
> This is binary data you are writing to this sysfs file, correct?
> Don't try to interpret it as a string.  You could avoid the problem
> with something more like:
>     pr_err("bad port config size (%zu, should be %zu)", count,
> sizeof(*cfg));
>
> > +             return -EINVAL;
> > +     }
> > +     mikrobus_register_port_config((void *)buf);
>
> mikrobus_register_port_config() returns an error value, and
> that should be returned from this function if it's non-zero.
>
> Don't cast the buffer to a void pointer; cast it to the actual
> type represents (struct mikrobus_port_config *).
>
> > +     return count;
> > +}
> > +BUS_ATTR_WO(add_port);
> > +
> > +static ssize_t del_port_store(struct bus_type *bt, const char *buf,
> > +                                                       size_t count)
> > +{
> > +     int id;
> > +     char end;
> > +     int res;
> > +
> > +     res =3D sscanf(buf, "%d%c", &id, &end);
>
> The id value you pass to idr_find() is an unsigned long.
> You might as well define "id" with that type and scan that
> type here.  Make sure it's in the valid range for your
> identifier as a separate step.  (There might be a good
> reason you use a signed int as an identifier, but I would
> recommend unsigned, with a well-defined number of bits,
> such as u32).
>
> Is "end" intended to just consume an optional trailing newline?
>
> > +     if (res < 1) {
> > +             pr_err("delete_port: cannot parse mikrobus port ID\n");
>
> I don't think "delete_port: " here is necessary.  (Take this
> comment to apply in all similar cases; I won't mention it
> again.)
>
> > +             return -EINVAL;
> > +     }
> > +     if (!idr_find(&mikrobus_port_idr, id)) {
> > +             pr_err("attempting to delete unregistered port [%d]\n",
> id);
>
> Maybe just "mikrobus port %lu not registered".
>
> > +             return -EINVAL;
> > +     }
> > +     mikrobus_del_port(idr_find(&mikrobus_port_idr, id));
> > +     return count;
> > +}
> > +BUS_ATTR_WO(del_port);
> > +
> > +static struct attribute *mikrobus_attrs[] =3D {
> > +     &bus_attr_add_port.attr,
> > +     &bus_attr_del_port.attr,
> > +      NULL
> > +};
> > +ATTRIBUTE_GROUPS(mikrobus);
> > +
> > +struct bus_type mikrobus_bus_type =3D {
> > +     .name =3D "mikrobus",
> > +     .bus_groups =3D mikrobus_groups,
> > +};
> > +EXPORT_SYMBOL_GPL(mikrobus_bus_type);
> > +
> > +static int mikrobus_manifest_header_validate(struct mikrobus_port *por=
t)
> > +{
> > +     char header[12];
> > +     struct addon_board_info *board;
> > +     int manifest_size;
> > +     int retval;
> > +     char *buf;
> > +
> > +     nvmem_device_read(port->eeprom, 0, 12, header);
>
> This function returns a value, and if it's less than zero you
> should return it as the result of mikrobus_manifest_header_validate()
> (possibly after reporting an error).
>
> > +     manifest_size =3D mikrobus_manifest_header_validate(header, 12);
> > +     if (manifest_size > 0) {
> > +             buf =3D kzalloc(manifest_size, GFP_KERNEL);
>
> Check whether kzalloc() returns NULL, and if so, return -ENOMEM.
>
> > +             nvmem_device_read(port->eeprom, 0, manifest_size, buf);
>
> Check the return value here, and if negative, free your buffer
> and return the error.  (I won't make this comment any more if
> I see other instances of ignoring the nvmem_device_read()
> return value.)
>
> > +             board =3D kzalloc(sizeof(*board), GFP_KERNEL);
> > +             if (!board)
> > +                     return -ENOMEM;
>
> You need to free the buffer you allocated before you return here.
> It is helpful to use the "goto <error path>" pattern.  I.e.:
>
>         if (!board) {
>                 retval =3D -ENOMEM;
>                 goto err_free_buf;
>         }
> ...
>
> err_free_buf:
>         kfree(buf);
>
>         return retval;
> }
>
> > +             INIT_LIST_HEAD(&board->manifest_descs);
> > +             INIT_LIST_HEAD(&board->devices);
> > +             retval =3D mikrobus_manifest_parse(board, (void *)buf,
> manifest_size);
>
> No need to cast buf to (void *).
>
> I have more comments on mikrobus_manifest_parse() below.  But it
> might be useful to have it return an integer (0 or error code)
> rather than Boolean.  Assuming you did that...
>
> > +             if (!retval) {
> > +                     pr_err("failed to parse manifest, size: %d",
> manifest_size);
>
>         if (retval)
>                 goto err_free_board;
> ...
>
> err_free_board:
>         free_board(board);
> err_free_buf:
>         free_buf(buf);
>
>         return retval;
> }
>
> > +                     return -EINVAL;
> > +             }
> > +             retval =3D mikrobus_register_board(port, board);
> > +             if (retval) {
> > +                     pr_err("failed to register board: %s",
> board->name);
>
>         goto err_free_board;
>
> > +                     return -EINVAL;
> > +             }
> > +             kfree(buf);
> > +     } else {
> > +             pr_err("inavlide manifest port %d", port->id);
>
> s/inavlide/invalid/
>
> > +             return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static ssize_t name_show(struct device *dev, struct device_attribute
> *attr,
> > +                                              char *buf)
> > +{
> > +     return sprintf(buf, "%s\n", to_mikrobus_port(dev)->name);
> > +}
> > +static DEVICE_ATTR_RO(name);
> > +
> > +static ssize_t new_device_store(struct device *dev, struct
> device_attribute *attr,
> > +                                      const char *buf, size_t count)
> > +{
> > +     struct mikrobus_port *port =3D to_mikrobus_port(dev);
> > +     struct addon_board_info *board;
> > +     int retval;
> > +
> > +     if (port->board =3D=3D NULL) {
>
> This is just a style suggestion, but I would prefer this, because it
> reduces the indentation of the normal path:
>
>         if (port->board) {
>                 pr_err("mikrobus port %d already has a board registered\n=
",
>                         port->id);
>                 return -EBUSY;
>         }
>
>         port->board =3D kzalloc(...);
>         if (!port->board)
>                 return -ENOMEM;
>
> Also note the return values I suggest here.
>
> > +             board =3D kzalloc(sizeof(*board), GFP_KERNEL);
> > +             if (!board)
> > +                     return -EINVAL;
> > +             INIT_LIST_HEAD(&board->manifest_descs);
> > +             INIT_LIST_HEAD(&board->devices);
> > +     } else {
> > +             pr_err("port %d already has board registered", port->id);
> > +             return -EINVAL;
> > +     }
> > +     retval =3D mikrobus_manifest_parse(board, (void *)buf, count);
> > +     if (!retval) {
> > +             pr_err("failed to parse manifest");
> > +             return -EINVAL;
> > +     }
> > +     retval =3D mikrobus_register_board(port, board);
> > +     if (retval) {
> > +             pr_err("failed to register board: %s", board->name);
> > +             return -EINVAL;
> > +     }
> > +     return count;
> > +}
> > +static DEVICE_ATTR_WO(new_device);
> > +
> > +static ssize_t rescan_store(struct device *dev, struct device_attribut=
e
> *attr,
> > +                                                     const char *buf,
> size_t count)
> > +{
> > +     struct mikrobus_port *port =3D to_mikrobus_port(dev);
> > +     int id;
> > +     char end;
> > +     int res;
> > +     int retval;
> > +
> > +     res =3D sscanf(buf, "%d%c", &id, &end);
> > +     if (res < 1) {
> > +             pr_err("rescan: Can't parse trigger\n");
> > +             return -EINVAL;
> > +     }
> > +     if (port->board !=3D NULL) {
> > +             pr_err("port %d already has board registered", port->id);
> > +             return -EINVAL;
> > +     }
> > +     retval =3D mikrobus_port_scan_eeprom(port);
> > +     if (retval) {
> > +             pr_err("port %d board register from manifest failed",
> port->id);
> > +             return -EINVAL;
> > +     }
> > +     return count;
> > +}
> > +static DEVICE_ATTR_WO(rescan);
> > +
> > +static ssize_t delete_device_store(struct device *dev, struct
> device_attribute *attr,
> > +                                                     const char *buf,
> size_t count)
> > +{
> > +     int id;
> > +     char end;
> > +     int res;
> > +     struct mikrobus_port *port =3D to_mikrobus_port(dev);
> > +
> > +     res =3D sscanf(buf, "%d%c", &id, &end);
> > +     if (res < 1) {
> > +             pr_err("delete_board: Can't parse board ID\n");
> > +             return -EINVAL;
> > +     }
> > +     if (port->board =3D=3D NULL) {
>
> Normally in kernel code this form is used:
>
>         if (!port->board) {
>
> > +             pr_err("delete_board: port does not have any boards
> registered\n");
> > +             return -EINVAL;
> > +     }
> > +     mikrobus_unregister_board(port, port->board);
> > +     return count;
> > +}
> > +static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, 0200, NULL,
> delete_device_store);
> > +
> > +static struct attribute *mikrobus_port_attrs[] =3D {
> > +     &dev_attr_new_device.attr, &dev_attr_rescan.attr,
> > +     &dev_attr_delete_device.attr, &dev_attr_name.attr, NULL};
> > +ATTRIBUTE_GROUPS(mikrobus_port);
> > +
> > +static void mikrobus_dev_release(struct device *dev)
> > +{
> > +     struct mikrobus_port *port =3D to_mikrobus_port(dev);
> > +
> > +     idr_remove(&mikrobus_port_idr, port->id);
> > +     kfree(port);
> > +}
> > +
> > +struct device_type mikrobus_port_type =3D {
> > +     .groups =3D mikrobus_port_groups,
> > +     .release =3D mikrobus_dev_release,
> > +};
> > +EXPORT_SYMBOL_GPL(mikrobus_port_type);
> > +
> > +static int mikrobus_get_irq(struct mikrobus_port *port, int irqno,
> > +                                                     int irq_type)
> > +{
> > +     int irq;
> > +
> > +     switch (irqno) {
> > +     case MIKROBUS_GPIO_INT:
> > +     irq =3D gpiod_to_irq(port->int_gpio);
> > +     break;
>
> Please fix your indentation here.  (And everywhere; I give
> an example of the proper way to do it below.)
>
> > +     case MIKROBUS_GPIO_RST:
> > +     irq =3D gpiod_to_irq(port->rst_gpio);
> > +     break;
> > +     case MIKROBUS_GPIO_PWM:
> > +     irq =3D gpiod_to_irq(port->pwm_gpio);
> > +     break;
> > +     default:
> > +     return -EINVAL;
> > +     }
> > +     if (irq < 0) {
> > +             pr_err("Could not get irq for irq type: %d", irqno);
> > +             return -EINVAL;
> > +     }
> > +     irq_set_irq_type(irq, irq_type);
>
> It shouldn't return an error, but please check the
> return value here.
>
> > +     return irq;
> > +}
> > +
> > +static int mikrobus_setup_gpio(struct gpio_desc *gpio, int gpio_state)
> > +{
> > +     int retval;
> > +
> > +     if (gpio_state =3D=3D MIKROBUS_GPIO_UNUSED)
> > +             return 0;
> > +     switch (gpio_state) {
> > +     case MIKROBUS_GPIO_INPUT:
> > +     retval =3D gpiod_direction_input(gpio);
> > +     break;
> > +     case MIKROBUS_GPIO_OUTPUT_HIGH:
> > +     retval =3D gpiod_direction_output(gpio, 1);
> > +     gpiod_set_value_cansleep(gpio, 1);
> > +     break;
> > +     case MIKROBUS_GPIO_OUTPUT_LOW:
> > +     retval =3D gpiod_direction_output(gpio, 0);
> > +     gpiod_set_value_cansleep(gpio, 0);
> > +     break;
> > +     default:
> > +     return -EINVAL;
> > +     }
> > +     return retval;
> > +}
> > +
> > +static void mikrobus_spi_device_delete(struct spi_master *master,
> unsigned int cs)
> > +{
> > +     struct device *dev;
> > +     char str[32];
> > +
> > +     snprintf(str, sizeof(str), "%s.%u", dev_name(&master->dev), cs);
> > +     dev =3D bus_find_device_by_name(&spi_bus_type, NULL, str);
> > +     if (dev !=3D NULL) {
> > +             spi_unregister_device(to_spi_device(dev));
> > +             put_device(dev);
> > +     }
> > +}
> > +
> > +static char *mikrobus_get_gpio_chip_name(struct mikrobus_port *port,
> int gpio)
> > +{
> > +     char *name;
> > +     struct gpio_chip *gpiochip;
> > +
> > +     switch (gpio) {
> > +     case MIKROBUS_GPIO_INT:
> > +     gpiochip =3D gpiod_to_chip(port->int_gpio);
> > +     name =3D kmemdup(gpiochip->label, 40, GFP_KERNEL);
>
> Why 40?  Please use a symbolic constant so you can
> change it easily, and to give you a place to explain
> why 40 is the limit used.
>
> > +     break;
> > +     case MIKROBUS_GPIO_RST:
> > +     gpiochip =3D gpiod_to_chip(port->rst_gpio);
> > +     name =3D kmemdup(gpiochip->label, 40, GFP_KERNEL);
> > +     break;
> > +     case MIKROBUS_GPIO_PWM:
> > +     gpiochip =3D gpiod_to_chip(port->pwm_gpio);
> > +     name =3D kmemdup(gpiochip->label, 40, GFP_KERNEL);
> > +     break;
> > +     }
> > +     return name;
> > +}
> > +
> > +static int mikrobus_get_gpio_hwnum(struct mikrobus_port *port, int gpi=
o)
> > +{
> > +     int hwnum;
> > +     struct gpio_chip *gpiochip;
> > +
> > +     switch (gpio) {
> > +     case MIKROBUS_GPIO_INT:
> > +     gpiochip =3D gpiod_to_chip(port->int_gpio);
> > +     hwnum =3D desc_to_gpio(port->int_gpio) - gpiochip->base;
> > +     break;
> > +     case MIKROBUS_GPIO_RST:
> > +     gpiochip =3D gpiod_to_chip(port->rst_gpio);
> > +     hwnum =3D desc_to_gpio(port->rst_gpio) - gpiochip->base;
> > +     break;
> > +     case MIKROBUS_GPIO_PWM:
> > +     gpiochip =3D gpiod_to_chip(port->pwm_gpio);
> > +     hwnum =3D desc_to_gpio(port->pwm_gpio) - gpiochip->base;
> > +     break;
> > +     }
> > +     return hwnum;
> > +}
> > +
> > +static void release_mikrobus_device(struct board_device_info *dev)
>
> We tend to follow a convention throughout the Greybus code
> that has the object name as the prefix for things you do
> to the object.  I don't know how consistent that is, but
> my suggestion would be that these functions would be named
> something more like:
>     mikrobus_gpio_chip_name_get()
>     mikrobus_gpio_hwnum_get()
>     mikrobus_board_release_device_all()
>     mikrobus_device_register()
>     mikrobus_device_unregister()
>     mikrobus_board_register()
>     mikrobus_board_unregister()
> and so on.
>
> > +{
> > +     list_del(&dev->links);
> > +     kfree(dev);
> > +}
> > +
>
> (I skipped reviewing a lot here...)
> . . .
>
> > diff --git a/drivers/misc/mikrobus/mikrobus_core.h
> b/drivers/misc/mikrobus/mikrobus_core.h
> > new file mode 100644
> > index 000000000000..9684d315f564
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/mikrobus_core
> . . .
>
> > diff --git a/drivers/misc/mikrobus/mikrobus_manifest.c
> b/drivers/misc/mikrobus/mikrobus_manifest.c
> > new file mode 100644
> > index 000000000000..60ebca560f0d
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/mikrobus_manifest.c
> > @@ -0,0 +1,390 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * mikroBUS manifest parsing, an
> > + * extension to Greybus Manifest Parsing
> > + * under drivers/greybus/manifest.c
> > + *
> > + * Copyright 2014-2015 Google Inc.
> > + * Copyright 2014-2015 Linaro Ltd.
> > + */
> > +
> > +#define pr_fmt(fmt) "mikrobus_manifest: " fmt
> > +
> > +#include <linux/bits.h>
> > +#include <linux/types.h>
> > +#include <linux/property.h>
> > +#include <linux/greybus/greybus_manifest.h>
> > +
> > +#include "mikrobus_manifest.h"
> > +
> > +struct manifest_desc {
> > +     struct list_head links;
> > +     size_t size;
> > +     void *data;
> > +     enum greybus_descriptor_type type;
> > +};
> > +
> > +static void release_manifest_descriptor(struct manifest_desc
> *descriptor)
> > +{
> > +     list_del(&descriptor->links);
> > +     kfree(descriptor);
> > +}
> > +
> > +static void release_manifest_descriptors(struct addon_board_info *info=
)
> > +{
> > +     struct manifest_desc *descriptor;
> > +     struct manifest_desc *next;
> > +
> > +     list_for_each_entry_safe(descriptor, next, &info->manifest_descs,
> links)
> > +             release_manifest_descriptor(descriptor);
> > +}
> > +
> > +static int identify_descriptor(struct addon_board_info *info, struct
> greybus_descriptor *desc,
> > +
>       size_t size)
> > +{
>
> I know it's technically acceptable now, but please limit your lines to
> 80 characters in the Greybus code if possible.
>
> > +     struct greybus_descriptor_header *desc_header =3D &desc->header;
> > +     struct manifest_desc *descriptor;
> > +     size_t desc_size;
> > +     size_t expected_size;
> > +
> > +     if (size < sizeof(*desc_header))
> > +             return -EINVAL;
> > +     desc_size =3D le16_to_cpu(desc_header->size);
> > +     if (desc_size > size)
> > +             return -EINVAL;
>
> Probably check if (desc_size !=3D size) here.
>
> > +     expected_size =3D sizeof(*desc_header);
> > +     switch (desc_header->type) {
> > +     case GREYBUS_TYPE_STRING:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_string);
> > +     expected_size +=3D desc->string.length;
> > +     expected_size =3D ALIGN(expected_size, 4);
> > +     break;
>
> Your indentation is wrong here.  Please use:
>
>         switch (desc_header->type) {
>         case GREYBUS_TYPE_STRING:
>                 expected_size +=3D ...;
>                 ...
>                 break;
>         case GREYBUS_TYPE_PROPERTY:
>                 ...
>
> > +     case GREYBUS_TYPE_PROPERTY:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_property);
> > +     expected_size +=3D desc->property.length;
> > +     expected_size =3D ALIGN(expected_size, 4);
> > +     break;
> > +     case GREYBUS_TYPE_DEVICE:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_device);
> > +     break;
> > +     case GREYBUS_TYPE_MIKROBUS:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_mikrobus);
> > +     break;
> > +     case GREYBUS_TYPE_INTERFACE:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_interface);
> > +     break;
> > +     case GREYBUS_TYPE_CPORT:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_cport);
> > +     break;
> > +     case GREYBUS_TYPE_BUNDLE:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_bundle);
> > +     break;
> > +     case GREYBUS_TYPE_INVALID:
> > +     default:
> > +     return -EINVAL;
> > +     }
> > +
> > +     descriptor =3D kzalloc(sizeof(*descriptor), GFP_KERNEL);
> > +     if (!descriptor)
> > +             return -ENOMEM;
> > +     descriptor->size =3D desc_size;
> > +     descriptor->data =3D (char *)desc + sizeof(*desc_header);
> > +     descriptor->type =3D desc_header->type;
> > +     list_add_tail(&descriptor->links, &info->manifest_descs);
> > +     return desc_size;
> > +}
>
> . . .
>
> > +static int mikrobus_manifest_attach_device(struct addon_board_info
> *info,
> > +                                             struct
> greybus_descriptor_device *dev_desc)
> > +{
> > +     struct board_device_info *dev;
>
> I would suggest something other than "dev" as the name of
> a board_device.  The use of "dev" for (struct device *)
> is pretty prevalent in the kernel, and so using it here
> can be more confusing than it has to be.
>
> > +     struct gpiod_lookup_table *lookup;
> > +     struct greybus_descriptor_property *desc_property;
> > +     struct manifest_desc *descriptor;
> > +     int i;
> > +     u8 *prop_link;
> > +     u8 *gpio_desc_link;
> > +
> > +     dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> > +     if (!dev)
> > +             return -ENOMEM;
> > +     dev->id =3D dev_desc->id;
> > +     dev->drv_name =3D mikrobus_string_get(info,
> dev_desc->driver_stringid);
>
> This can return NULL.  You need to check for that, and free
> the board device you have already allocated.
>
> > +     dev->protocol =3D dev_desc->protocol;
> > +     dev->reg =3D dev_desc->reg;
> > +     dev->irq =3D dev_desc->irq;
> > +     dev->irq_type =3D dev_desc->irq_type;
> > +     dev->max_speed_hz =3D le32_to_cpu(dev_desc->max_speed_hz);
> > +     dev->mode =3D dev_desc->mode;
> > +     dev->cs_gpio =3D dev_desc->cs_gpio;
> > +     dev->num_gpio_resources =3D dev_desc->num_gpio_resources;
> > +     dev->num_properties =3D dev_desc->num_properties;
> > +     pr_info("device %d , number of properties=3D%d , number of gpio
> resources=3D%d\n",
> > +     dev->id, dev->num_properties, dev->num_gpio_resources);
> > +     if (dev->num_properties > 0) {
> > +             prop_link =3D mikrobus_property_link_get(info,
> dev_desc->prop_link,
> > +
>  MIKROBUS_PROPERTY_TYPE_LINK);
> > +             dev->properties =3D mikrobus_property_entry_get(info,
> prop_link, dev->num_properties);
> > +     }
> > +     if (dev->num_gpio_resources > 0) {
> > +             lookup =3D kzalloc(struct_size(lookup, table,
> dev->num_gpio_resources),
> > +                                     GFP_KERNEL);
> > +     if (!lookup)
> > +             return -ENOMEM;
>
> You can't return without freeing your previously-allocated resources.
>
> > +     gpio_desc_link =3D mikrobus_property_link_get(info,
> dev_desc->gpio_link,
> > +
>  MIKROBUS_PROPERTY_TYPE_GPIO);
> > +     for (i =3D 0; i < dev->num_gpio_resources; i++) {
> > +             list_for_each_entry(descriptor, &info->manifest_descs,
> links) {
> > +                     if (descriptor->type !=3D GREYBUS_TYPE_PROPERTY)
> > +                             continue;
> > +                     desc_property =3D descriptor->data;
> > +                     if (desc_property->id =3D=3D gpio_desc_link[i]) {
> > +                             lookup->table[i].chip_hwnum =3D
> *desc_property->value;
> > +                             lookup->table[i].con_id =3D
> > +                             mikrobus_string_get(info,
> desc_property->propname_stringid);
> > +                             break;
> > +                             }
> > +             }
> > +     }
> > +     dev->gpio_lookup =3D lookup;
> > +     }
> > +     list_add_tail(&dev->links, &info->devices);
> > +     return 0;
> > +}
> > +
> > +static int mikrobus_manifest_parse_devices(struct addon_board_info
> *info)
> > +{
> > +     struct greybus_descriptor_device *desc_device;
> > +     struct manifest_desc *desc, *next;
> > +     int devcount =3D 0;
> > +
> > +     if (WARN_ON(!list_empty(&info->devices)))
> > +             return false;
>
> The manifest comes from outside the kernel  I might be misunderstanding
> something, but you should not be using WARN_ON() if its content doesn't
> match what you expect.
>
> > +     list_for_each_entry_safe(desc, next, &info->manifest_descs, links=
)
> {
> > +             if (desc->type !=3D GREYBUS_TYPE_DEVICE)
> > +                     continue;
> > +             desc_device =3D desc->data;
> > +             mikrobus_manifest_attach_device(info, desc_device);
>
> You are ignoring the return value of mikrobus_manifest_attach_device().
>
> > +             devcount++;
> > +     }
> > +     return devcount;
> > +}
> > +
> > +bool mikrobus_manifest_parse(struct addon_board_info *info, void *data=
,
> > +                                                      size_t size)
>
> You use "board" as the name of a "board_info" variable elsewhere.
> That is much more helpful than "info".  Please use a consistent
> naming convention for your variables of given types if possible.
> It makes it easier to follow the code.
>
> > +{
> > +     struct greybus_manifest *manifest;
> > +     struct greybus_manifest_header *header;
> > +     struct greybus_descriptor *desc;
> > +     u16 manifest_size;
> > +     int dev_count;
> > +     int desc_size;
> > +
>
> Check the size before you bother checking anything else.
>
> > +     if (WARN_ON(!list_empty(&info->manifest_descs)))
> > +             return false;
> > +     if (size < sizeof(*header))
> > +             return false;
> > +     manifest =3D data;
> > +     header =3D &manifest->header;
> > +     manifest_size =3D le16_to_cpu(header->size);
> > +     if (manifest_size !=3D size)
> > +             return false;
>
> It would be helpful to report what the problem with the
> manifest is (here and in all cases).  Otherwise it's a
> little mysterious why adding a board fails.
>
> > +     if (header->version_major > MIKROBUS_VERSION_MAJOR)
> > +             return false;
>
> Version checks!!!  This is good!  But the topic is of great
> interest to Greybus people!  Not sure we ever completely
> resolved that.  That's my only comment on this for now.
>
> > +     desc =3D manifest->descriptors;
> > +     size -=3D sizeof(*header);
>
> Why aren't you using mikrobus_manifest_header_validate() here?
>
> > +     while (size) {
> > +             desc_size =3D identify_descriptor(info, desc, size);
>
> What you're really doing with identify_descriptor() is adding
> a valid descriptor to a board's list of descriptors.  I think
> the name of that function shoudl reflect that.  If it isn't
> identified, that's an error--but that's not the purpose of
> that function.  So maybe:
>         desc_ =3D board_descriptor_add(board, desc, size);
>
> > +             if (desc_size < 0) {
> > +                     pr_err("invalid manifest descriptor");
> > +             return -EINVAL;
> Your indentation of the return statement here is wrong.
>
> > +             }
> > +             desc =3D (struct greybus_descriptor *)((char *)desc +
> desc_size);
>
> I don't know if this is better, but this could be:
>                 desc =3D (void *)desc + desc_size;
>
> > +             size -=3D desc_size;
> > +     }
> > +     mikrobus_state_get(info);
> > +     dev_count =3D mikrobus_manifest_parse_devices(info);
> > +     pr_info(" %s manifest parsed with %d device(s)\n", info->name,
> > +             info->num_devices);
> > +     release_manifest_descriptors(info);
> > +     return true;
> > +}
> > +
> > +size_t mikrobus_manifest_header_validate(void *data, size_t size)
> > +{
> > +     struct greybus_manifest_header *header;
> > +     u16 manifest_size;
> > +
> > +     if (size < sizeof(*header))
> > +             return 0;
> > +
> > +     header =3D data;
> > +     manifest_size =3D le16_to_cpu(header->size);
> > +     if (header->version_major > MIKROBUS_VERSION_MAJOR)
> > +             return 0;
> > +     return manifest_size;
> > +}
> > diff --git a/drivers/misc/mikrobus/mikrobus_manifest.h
> b/drivers/misc/mikrobus/mikrobus_manifest.h
> > new file mode 100644
> > index 000000000000..a195d1c26493
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/mikrobus_manifest.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * mikroBUS manifest definition
> > + * extension to Greybus Manifest Definition
> > + *
> > + * Copyright 2014-2015 Google Inc.
> > + * Copyright 2014-2015 Linaro Ltd.
> > + *
> > + * Released under the GPLv2 and BSD licenses.
> > + */
> > +
> > +#ifndef __MIKROBUS_MANIFEST_H
> > +#define __MIKROBUS_MANIFEST_H
> > +
> > +#include "mikrobus_core.h"
> > +
> > +bool mikrobus_manifest_parse(struct addon_board_info *info, void *data=
,
> > +                                                      size_t size);
> > +size_t mikrobus_manifest_header_validate(void *data, size_t size);
> > +
> > +#endif /* __MIKROBUS_MANIFEST_H */
> > diff --git a/include/linux/greybus/greybus_manifest.h
> b/include/linux/greybus/greybus_manifest.h
> > index 6e62fe478712..79c8cab9ef96 100644
> > --- a/include/linux/greybus/greybus_manifest.h
> > +++ b/include/linux/greybus/greybus_manifest.h
> > @@ -23,6 +23,9 @@ enum greybus_descriptor_type {
> >       GREYBUS_TYPE_STRING             =3D 0x02,
> >       GREYBUS_TYPE_BUNDLE             =3D 0x03,
> >       GREYBUS_TYPE_CPORT              =3D 0x04,
> > +     GREYBUS_TYPE_MIKROBUS   =3D 0x05,
> > +     GREYBUS_TYPE_PROPERTY   =3D 0x06,
> > +     GREYBUS_TYPE_DEVICE     =3D 0x07,
>
> Please align your new values with the rest, for consistency.
>
> >  };
> >
> >  enum greybus_protocol {
> > @@ -151,6 +154,53 @@ struct greybus_descriptor_cport {
> >       __u8    protocol_id;    /* enum greybus_protocol */
> >  } __packed;
> >
> > +/*
> > + * A mikrobus descriptor is used to describe the details
> > + * about the add-on board connected to the mikrobus port.
> > + * It describes the number of indivdual devices on the
> > + * add-on board and the default states of the GPIOs
> > + */
> > +struct greybus_descriptor_mikrobus {
> > +     __u8 num_devices;
> > +     __u8 rst_gpio_state;
> > +     __u8 pwm_gpio_state;
> > +     __u8 int_gpio_state;
> > +} __packed;
> > +
> > +/*
> > + * A property descriptor is used to pass named properties
> > + * to device drivers through the unified device properties
> > + * interface under linux/property.h
> > + */
> > +struct greybus_descriptor_property {
> > +     __u8 length;
> > +     __u8 id;
> > +     __u8 propname_stringid;
> > +     __u8 type;
> > +     __u8 value[0];
> > +} __packed;
> > +
> > +/*
> > + * A device descriptor is used to describe the
> > + * details required by a add-on board device
> > + * driver.
> > + */
> > +struct greybus_descriptor_device {
> > +     __u8 id;
> > +     __u8 driver_stringid;
> > +     __u8 num_properties;
> > +     __u8 protocol;
> > +     __le32 max_speed_hz;
> > +     __u8 reg;
> > +     __u8 mode;
> > +     __u8 num_gpio_resources;
> > +     __u8 cs_gpio;
> > +     __u8 irq;
> > +     __u8 irq_type;
> > +     __u8 prop_link;
> > +     __u8 gpio_link;
> > +} __packed;
> > +
> >  struct greybus_descriptor_header {
> >       __le16  size;
> >       __u8    type;           /* enum greybus_descriptor_type */
> > @@ -164,6 +214,9 @@ struct greybus_descriptor {
> >               struct greybus_descriptor_interface     interface;
> >               struct greybus_descriptor_bundle        bundle;
> >               struct greybus_descriptor_cport         cport;
> > +             struct greybus_descriptor_mikrobus      mikrobus;
> > +             struct greybus_descriptor_property      property;
> > +             struct greybus_descriptor_device        device;
>
> We're going to need to talk about these things...  But I can't
> comment much more without learning more about the broader
> architecture.
>
>                                         -Alex
>
> >       };
> >  } __packed;
> >
> >
>
> _______________________________________________
> greybus-dev mailing list
> greybus-dev@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/greybus-dev
>
--=20
https://beagleboard.org/about/jkridner - a 501c3 non-profit educating
around open hardware computing

--0000000000001dd7d705ab5ba997
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 26, 2020 at 11:04 AM Alex Elder &lt;<a href=3D"=
mailto:elder@linaro.org">elder@linaro.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">On 7/24/20 7:06 AM, Vaishnav M A wrote:<br>
&gt; Attached is a patch for the mikroBUS driver which helps to<br>
&gt; instantiate an add-on board device on a mikrobus port by fetching<br>
&gt; the device identifier manifest binary from an EEPROM on-board<br>
&gt; the device. mikroBUS is an add-on board socket standard by<br>
&gt; MikroElektronika that can be freely used by anyone<br>
&gt; following the guidelines, more details and discussions on<br>
&gt; the status of the driver can be found here in this eLinux wiki:<br>
&gt; <a href=3D"https://elinux.org/Mikrobus" rel=3D"noreferrer" target=3D"_=
blank">https://elinux.org/Mikrobus</a><br>
<br>
I had some other things I would comment on in this code review,<br>
but there are a lot of somewhat superficial things you should<br>
fix.=C2=A0 I looked at much--but not all--of this, and I&#39;ll want to<br>
review this again after you&#39;ve fixed the simple things.=C2=A0 I also<br=
>
can provide more substantive feedback after I&#39;ve had more time<br>
to digest the bigger picture of microBUS.<br>
<br>
You should assume it will take a few iterations to get to the<br>
point where things are shaping up for acceptance.<br>
<br>
All that said, your basic foundation looks good.<br>
<br>
&gt; In the current state of the driver, more than 80 different<br>
&gt; add-on boards have been tested on the BeagleBoard.org<br>
&gt; PocketBeagle and the manifest binary is generated using the same<br>
&gt; manifesto tool used to generate Greybus manifest binaries,<br>
&gt; The pull request to manifesto to add new descriptors specific<br>
&gt; to mikrobus is here : <a href=3D"https://github.com/projectara/manifes=
to/pull/2" rel=3D"noreferrer" target=3D"_blank">https://github.com/projecta=
ra/manifesto/pull/2</a><br>
&gt; The utilization of Greybus manifest binaries here is not entirely<br>
&gt; coincidental, We are evaluating ways to add mikroBUS sockets and<br>
&gt; devices via Greybus expansion.<br>
&gt; <br>
&gt; The mikroBUS standard includes SPI, I2C, UART, PWM, ADC, GPIO<br>
&gt; and power (3.3V and 5V) connections to interface common embedded<br>
&gt; peripherals, There are more than 750 add-on boards ranging from<br>
&gt; wireless connectivity boards to human-machine interface sensors<br>
&gt; which conform to the mikroBUS standard, out of which more than 140<br>
&gt; boards already have support in the Linux kernel.Today, there is no<br>
&gt; mainlinesolution for enabling mikroBUS add-on boards at run-time, the<=
br>
&gt; most straight forward method for loading drivers is to provide<br>
&gt; device-tree overlay fragments at boot time, this method suffers<br>
&gt; from the need to maintain a large out-of-tree database for which there=
<br>
&gt; is need to maintain an overlay for every mikroBUS add-on board for eve=
ry<br>
&gt; Linux system and for every mikroBUS socket on that system.<br>
&gt; <br>
&gt; The mikroBUS driver tries to solve the problem by using extended versi=
on<br>
&gt; of the greybus manifest to describe the add-on board device specific<b=
r>
&gt; information required by the device driver and uses it along with the f=
ixed<br>
&gt; port specific information to probe the specific device driver.The mani=
fest<br>
&gt; binary is now fetched from an I2C EEPROM over the I2C bus on the mikro=
BUS<br>
&gt; port(subject to change in mikroBUS v3 specification) and enumerate dri=
vers<br>
&gt; for the add-on devices.There is also ongoing work to define a mikroBUS=
<br>
&gt; v3 standard in which the addon board includes a non-volatile storage t=
o<br>
&gt; store the device identifier manifest binary, once the mikroBUS v3 stan=
dard<br>
&gt; is released, the mikroBUS can be seen as a probeable bus such that the=
<br>
&gt; kernel can discover the device on the bus at boot time.<br>
&gt; <br>
&gt; The driver also has a few debug SysFS interfaces for testing on add-on=
<br>
&gt; boards without an EEPROM, these can be used in the following manner:<b=
r>
&gt; (example for mikroBUS port 1 on BeagleBoard.org PocketBeagle):<br>
<br>
You should probably use debugfs, since this is a temporary thing.<br>
But I guess if it&#39;s not actually upstream (and it sounds like you<br>
might be avoiding the need for this with EEPROM anyway) maybe<br>
that doesn&#39;t matter much.<br>
<br>
&gt; printf &quot;%b&quot; &#39;\x01\x00\x00\x59\x32\x17&#39; &gt; /sys/bus=
/mikrobus/add_port<br>
&gt; <br>
&gt; The bytes in the byte array sequence are (in order):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* i2c_adap_nr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* spi_master_nr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* serdev_ctlr_nr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* rst_gpio_nr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* pwm_gpio_nr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* int_gpio_nr<br>
&gt; * add_port sysFS entry is purely for debug and in the actual state<br>
&gt; of the driver, port configuration will be loaded from a suitable<br>
&gt; device tree overlay fragment.<br>
&gt; <br>
&gt; echo 0 &gt; /sys/bus/mikrobus/del_port (to delete the attached port)<b=
r>
&gt; echo 1 &gt;=C2=A0 /sys/class/mikrobus-port/mikrobus-0/rescan (to resca=
n the EEPROM<br>
&gt; contents on the I2C bus on the mikroBUS port).<br>
&gt; <br>
&gt; cat board_manifest.mnfb &gt;=C2=A0 /sys/class/mikrobus-port/mikrobus-0=
/new_device<br>
&gt; * debug interface to pass the manifest binary in case an EEPROM is abs=
ent<br>
&gt; echo 0 &gt;=C2=A0 /sys/class/mikrobus-port/mikrobus-0/delete_device<br=
>
&gt; * to unload the loaded board on the mikrobus port<br>
&gt; <br>
&gt; These sysFS interfaces are only implemented for debug purposes and<br>
&gt; in the actual implementation of the driver these will be removed and<b=
r>
&gt; the manifest binary will be fetched from the non volatile storage on-b=
oard<br>
&gt; the device.<br>
&gt; <br>
&gt; The mikroBUS driver enable the mikroBUS to be a probeable bus such tha=
t<br>
&gt; the kernel can discover the device and automatically load the drivers.=
<br>
&gt; There are already several Linux platforms with mikroBUS sockets and th=
e<br>
&gt; mikroBUS driver helps to reduce the time to develop and debug<br>
&gt; support for various mikroBUS add-on boards. Further, it opens up<br>
&gt; the possibility for support under dynamically instantiated buses<br>
&gt; such as with Greybus.<br>
&gt; <br>
&gt; Please let know the feedback you have on this patch or the approach us=
ed.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Vaishnav M A<br>
&gt; <br>
&gt; Signed-off-by: Vaishnav M A &lt;<a href=3D"mailto:vaishnav@beagleboard=
.org" target=3D"_blank">vaishnav@beagleboard.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 =
+<br>
&gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/misc/mikrobus/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 16 +<br>
&gt;=C2=A0 drivers/misc/mikrobus/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/misc/mikrobus/mikrobus_core.c=C2=A0 =C2=A0 =C2=A0| 649 +=
+++++++++++++++++++++<br>
&gt;=C2=A0 drivers/misc/mikrobus/mikrobus_core.h=C2=A0 =C2=A0 =C2=A0| 130 +=
++++<br>
&gt;=C2=A0 drivers/misc/mikrobus/mikrobus_manifest.c | 390 +++++++++++++<br=
>
&gt;=C2=A0 drivers/misc/mikrobus/mikrobus_manifest.h |=C2=A0 21 +<br>
&gt;=C2=A0 include/linux/greybus/greybus_manifest.h=C2=A0 |=C2=A0 53 ++<br>
&gt;=C2=A0 10 files changed, 1272 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/misc/mikrobus/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/misc/mikrobus/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/misc/mikrobus/mikrobus_core.c<br>
&gt;=C2=A0 create mode 100644 drivers/misc/mikrobus/mikrobus_core.h<br>
&gt;=C2=A0 create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.c<br>
&gt;=C2=A0 create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.h<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index d53db30d1365..9a049746203f 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -11402,6 +11402,12 @@ M:=C2=A0 =C2=A0Oliver Neukum &lt;<a href=3D"m=
ailto:oliver@neukum.org" target=3D"_blank">oliver@neukum.org</a>&gt;<br>
&gt;=C2=A0 S:=C2=A0 =C2=A0Maintained<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/usb/image/microtek.*<br>
&gt;=C2=A0 <br>
&gt; +MIKROBUS ADDON BOARD DRIVER<br>
&gt; +M:=C2=A0 =C2=A0Vaishnav M A &lt;<a href=3D"mailto:vaishnav@beagleboar=
d.org" target=3D"_blank">vaishnav@beagleboard.org</a>&gt;<br>
&gt; +S:=C2=A0 =C2=A0Maintained<br>
&gt; +W:=C2=A0 =C2=A0<a href=3D"https://elinux.org/Mikrobus" rel=3D"norefer=
rer" target=3D"_blank">https://elinux.org/Mikrobus</a><br>
&gt; +F:=C2=A0 =C2=A0drivers/misc/mikrobus/<br>
&gt; +<br>
&gt;=C2=A0 MIPS<br>
&gt;=C2=A0 M:=C2=A0 =C2=A0Thomas Bogendoerfer &lt;<a href=3D"mailto:tsbogen=
d@alpha.franken.de" target=3D"_blank">tsbogend@alpha.franken.de</a>&gt;<br>
&gt;=C2=A0 L:=C2=A0 =C2=A0<a href=3D"mailto:linux-mips@vger.kernel.org" tar=
get=3D"_blank">linux-mips@vger.kernel.org</a><br>
&gt; diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig<br>
&gt; index e1b1ba5e2b92..334f0c39d56b 100644<br>
&gt; --- a/drivers/misc/Kconfig<br>
&gt; +++ b/drivers/misc/Kconfig<br>
&gt; @@ -472,4 +472,5 @@ source &quot;drivers/misc/ocxl/Kconfig&quot;<br>
&gt;=C2=A0 source &quot;drivers/misc/cardreader/Kconfig&quot;<br>
&gt;=C2=A0 source &quot;drivers/misc/habanalabs/Kconfig&quot;<br>
&gt;=C2=A0 source &quot;drivers/misc/uacce/Kconfig&quot;<br>
&gt; +source &quot;drivers/misc/mikrobus/Kconfig&quot;<br>
&gt;=C2=A0 endmenu<br>
&gt; diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile<br>
&gt; index c7bd01ac6291..45486dd77da5 100644<br>
&gt; --- a/drivers/misc/Makefile<br>
&gt; +++ b/drivers/misc/Makefile<br>
&gt; @@ -40,6 +40,7 @@ obj-$(CONFIG_VMWARE_BALLOON)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D vmw_balloon.o<br>
&gt;=C2=A0 obj-$(CONFIG_PCH_PHUB)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0+=3D pch_phub.o<br>
&gt;=C2=A0 obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D ti-st/<br>
&gt;=C2=A0 obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D lis3lv02d/<br>
&gt; +obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D mikrobus/<br>
&gt;=C2=A0 obj-$(CONFIG_ALTERA_STAPL)=C2=A0 =C2=A0+=3Daltera-stapl/<br>
&gt;=C2=A0 obj-$(CONFIG_INTEL_MEI)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 +=3D mei/<br>
&gt;=C2=A0 obj-$(CONFIG_VMWARE_VMCI)=C2=A0 =C2=A0 +=3D vmw_vmci/<br>
&gt; diff --git a/drivers/misc/mikrobus/Kconfig b/drivers/misc/mikrobus/Kco=
nfig<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..c3b93e12daad<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/Kconfig<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +menuconfig MIKROBUS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;Module for instantiating devices o=
n mikroBUS ports&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This option enables the mikroBUS driver. m=
ikroBUS is an add-on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0board socket standard that offers maximum =
expandability with<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0the smallest number of pins. The mikroBUS =
driver helps in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0instantiating devices on the mikroBUS port=
 with identifier<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0data fetched from an EEPROM on the device,=
 more details on<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0the mikroBUS driver support and discussion=
 can be found in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0this eLinux wiki : <a href=3D"http://elinu=
x.org/Mikrobus" rel=3D"noreferrer" target=3D"_blank">elinux.org/Mikrobus</a=
><br>
<br>
This text could be cleaned up a bit.=C2=A0 For example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The mikroBUS driver instantiates devices on a m=
ikroBUS port<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 described by identifying data present in device=
-resident EEPROM.<br>
<br>
Using well-defined terms can help a lot.=C2=A0 Is a physical thing that<br>
plugs into a microbus port called a &quot;board&quot;?=C2=A0</blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I agree language is important a=
nd should be consistent. There are mikroBUS sockets and =E2=80=9Cadd-on boa=
rds=E2=80=9D.=C2=A0 The Mikroelektronika guys might be able to be more prec=
ise, but this ia my understanding.=C2=A0</div><div dir=3D"auto"><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"> Can a &quot;board&quot; present<br>
more than one device to the system?=C2=A0 </blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">It isn=E2=80=99t common with existing add-on boar=
ds, but should be allowed.=C2=A0</div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">Is the EEPROM associated with<br>
the board, or a device?</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">Board.=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=C2=
=A0 My point isn&#39;t that those answers belong<br>
here, but that having meaningful terms can help you describe things<br>
concisely.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here to enable support for this driv=
er.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this code as a module, chose M =
here: the module<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0will be called mikrobus.ko<br>
&gt; diff --git a/drivers/misc/mikrobus/Makefile b/drivers/misc/mikrobus/Ma=
kefile<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..1f80ed4064d8<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/Makefile<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0<br>
&gt; +# mikroBUS Core<br>
&gt; +<br>
&gt; +mikrobus-y :=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 mikrobus_core.o mikrobus_m=
anifest.o<br>
&gt; +obj-$(CONFIG_MIKROBUS) +=3D mikrobus.o<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/drivers/misc/mikrobus/mikrobus_core.c b/drivers/misc/mikr=
obus/mikrobus_core.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..78c96c637632<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/mikrobus_core.c<br>
&gt; @@ -0,0 +1,649 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * mikroBUS driver for instantiating add-on<br>
&gt; + * board devices with an identifier EEPROM<br>
&gt; + *<br>
&gt; + * Copyright 2020 Vaishnav M A, BeagleBoard.org Foundation.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define pr_fmt(fmt) &quot;mikrobus: &quot; fmt<br>
&gt; +<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/errno.h&gt;<br>
&gt; +#include &lt;linux/idr.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/jump_label.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/i2c.h&gt;<br>
&gt; +#include &lt;linux/gpio.h&gt;<br>
&gt; +#include &lt;linux/gpio/machine.h&gt;<br>
&gt; +#include &lt;linux/nvmem-consumer.h&gt;<br>
&gt; +#include &lt;linux/nvmem-provider.h&gt;<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/spi/spi.h&gt;<br>
&gt; +#include &lt;linux/serdev.h&gt;<br>
&gt; +#include &lt;linux/property.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;mikrobus_core.h&quot;<br>
&gt; +#include &quot;mikrobus_manifest.h&quot;<br>
&gt; +<br>
&gt; +#define ATMEL_24C32_I2C_ADDR 0x57<br>
<br>
I&#39;m just getting started looking through this, so maybe I&#39;ll find<b=
r>
out soon. But why is this ATMEL I2C address needed in the core code?<br>
<br>
&gt; +static DEFINE_IDR(mikrobus_port_idr);<br>
&gt; +static struct class_compat *mikrobus_port_compat_class;<br>
&gt; +static bool is_registered;<br>
&gt; +<br>
&gt; +static ssize_t add_port_store(struct bus_type *bt, const char *buf,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port_config *cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (count &lt; sizeof(*cfg)) {<br>
<br>
Perhaps this should be:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (count !=3D sizeof(*cfg)) {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;add_port=
: incorrect config data received: %s\n&quot;, buf);<br>
<br>
I don&#39;t think you need to include &quot;add_port: &quot;.<br>
<br>
This is binary data you are writing to this sysfs file, correct?<br>
Don&#39;t try to interpret it as a string.=C2=A0 You could avoid the proble=
m<br>
with something more like:<br>
=C2=A0 =C2=A0 pr_err(&quot;bad port config size (%zu, should be %zu)&quot;,=
 count, sizeof(*cfg));<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_register_port_config((void *)buf);<br>
<br>
mikrobus_register_port_config() returns an error value, and<br>
that should be returned from this function if it&#39;s non-zero.<br>
<br>
Don&#39;t cast the buffer to a void pointer; cast it to the actual<br>
type represents (struct mikrobus_port_config *).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +BUS_ATTR_WO(add_port);<br>
&gt; +<br>
&gt; +static ssize_t del_port_store(struct bus_type *bt, const char *buf,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char end;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int res;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D sscanf(buf, &quot;%d%c&quot;, &amp;id, &a=
mp;end);<br>
<br>
The id value you pass to idr_find() is an unsigned long.<br>
You might as well define &quot;id&quot; with that type and scan that<br>
type here.=C2=A0 Make sure it&#39;s in the valid range for your<br>
identifier as a separate step.=C2=A0 (There might be a good<br>
reason you use a signed int as an identifier, but I would<br>
recommend unsigned, with a well-defined number of bits,<br>
such as u32).<br>
<br>
Is &quot;end&quot; intended to just consume an optional trailing newline?<b=
r>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (res &lt; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;delete_p=
ort: cannot parse mikrobus port ID\n&quot;);<br>
<br>
I don&#39;t think &quot;delete_port: &quot; here is necessary.=C2=A0 (Take =
this<br>
comment to apply in all similar cases; I won&#39;t mention it<br>
again.)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!idr_find(&amp;mikrobus_port_idr, id)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;attempti=
ng to delete unregistered port [%d]\n&quot;, id);<br>
<br>
Maybe just &quot;mikrobus port %lu not registered&quot;.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_del_port(idr_find(&amp;mikrobus_port_idr=
, id));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +BUS_ATTR_WO(del_port);<br>
&gt; +<br>
&gt; +static struct attribute *mikrobus_attrs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;bus_attr_add_port.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;bus_attr_del_port.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 NULL<br>
&gt; +};<br>
&gt; +ATTRIBUTE_GROUPS(mikrobus);<br>
&gt; +<br>
&gt; +struct bus_type mikrobus_bus_type =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.name =3D &quot;mikrobus&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bus_groups =3D mikrobus_groups,<br>
&gt; +};<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_bus_type);<br>
&gt; +<br>
&gt; +static int mikrobus_manifest_header_validate(struct mikrobus_port *po=
rt)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char header[12];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct addon_board_info *board;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int manifest_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nvmem_device_read(port-&gt;eeprom, 0, 12, header)=
;<br>
<br>
This function returns a value, and if it&#39;s less than zero you<br>
should return it as the result of mikrobus_manifest_header_validate()<br>
(possibly after reporting an error).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0manifest_size =3D mikrobus_manifest_header_valida=
te(header, 12);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (manifest_size &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D kzalloc(manif=
est_size, GFP_KERNEL);<br>
<br>
Check whether kzalloc() returns NULL, and if so, return -ENOMEM.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvmem_device_read(por=
t-&gt;eeprom, 0, manifest_size, buf);<br>
<br>
Check the return value here, and if negative, free your buffer<br>
and return the error.=C2=A0 (I won&#39;t make this comment any more if<br>
I see other instances of ignoring the nvmem_device_read()<br>
return value.)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0board =3D kzalloc(siz=
eof(*board), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!board)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENOMEM;<br>
<br>
You need to free the buffer you allocated before you return here.<br>
It is helpful to use the &quot;goto &lt;error path&gt;&quot; pattern.=C2=A0=
 I.e.:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!board) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D -ENOMEM;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_buf;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
...<br>
<br>
err_free_buf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(buf);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return retval;<br>
}<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;b=
oard-&gt;manifest_descs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;b=
oard-&gt;devices);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_m=
anifest_parse(board, (void *)buf, manifest_size);<br>
<br>
No need to cast buf to (void *).<br>
<br>
I have more comments on mikrobus_manifest_parse() below.=C2=A0 But it<br>
might be useful to have it return an integer (0 or error code)<br>
rather than Boolean.=C2=A0 Assuming you did that...<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;failed to parse manifest, size: %d&quot;, manifest_size=
);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (retval)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_board=
;<br>
...<br>
<br>
err_free_board:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 free_board(board);<br>
err_free_buf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 free_buf(buf);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return retval;<br>
}<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_r=
egister_board(port, board);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;failed to register board: %s&quot;, board-&gt;name);<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_free_board;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;inavlide=
 manifest port %d&quot;, port-&gt;id);<br>
<br>
s/inavlide/invalid/<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t name_show(struct device *dev, struct device_attribute =
*attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, to_mikrobus=
_port(dev)-&gt;name);<br>
&gt; +}<br>
&gt; +static DEVICE_ATTR_RO(name);<br>
&gt; +<br>
&gt; +static ssize_t new_device_store(struct device *dev, struct device_att=
ribute *attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char =
*buf, size_t count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port *port =3D to_mikrobus_port(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct addon_board_info *board;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (port-&gt;board =3D=3D NULL) {<br>
<br>
This is just a style suggestion, but I would prefer this, because it<br>
reduces the indentation of the normal path:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (port-&gt;board) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;mikrob=
us port %d already has a board registered\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 port-&gt;id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EBUSY;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 port-&gt;board =3D kzalloc(...);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!port-&gt;board)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
Also note the return values I suggest here.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0board =3D kzalloc(siz=
eof(*board), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!board)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;b=
oard-&gt;manifest_descs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;b=
oard-&gt;devices);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;port %d =
already has board registered&quot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_manifest_parse(board, (void *=
)buf, count);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;failed t=
o parse manifest&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_register_board(port, board);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;failed t=
o register board: %s&quot;, board-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +static DEVICE_ATTR_WO(new_device);<br>
&gt; +<br>
&gt; +static ssize_t rescan_store(struct device *dev, struct device_attribu=
te *attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port *port =3D to_mikrobus_port(d=
ev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char end;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D sscanf(buf, &quot;%d%c&quot;, &amp;id, &a=
mp;end);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (res &lt; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;rescan: =
Can&#39;t parse trigger\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (port-&gt;board !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;port %d =
already has board registered&quot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_port_scan_eeprom(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;port %d =
board register from manifest failed&quot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +static DEVICE_ATTR_WO(rescan);<br>
&gt; +<br>
&gt; +static ssize_t delete_device_store(struct device *dev, struct device_=
attribute *attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char end;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port *port =3D to_mikrobus_port(d=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D sscanf(buf, &quot;%d%c&quot;, &amp;id, &a=
mp;end);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (res &lt; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;delete_b=
oard: Can&#39;t parse board ID\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (port-&gt;board =3D=3D NULL) {<br>
<br>
Normally in kernel code this form is used:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!port-&gt;board) {<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;delete_b=
oard: port does not have any boards registered\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_unregister_board(port, port-&gt;board);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +static DEVICE_ATTR_IGNORE_LOCKDEP(delete_device, 0200, NULL, delete_d=
evice_store);<br>
&gt; +<br>
&gt; +static struct attribute *mikrobus_port_attrs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_new_device.attr, &amp;dev_attr_resc=
an.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_delete_device.attr, &amp;dev_attr_n=
ame.attr, NULL};<br>
&gt; +ATTRIBUTE_GROUPS(mikrobus_port);<br>
&gt; +<br>
&gt; +static void mikrobus_dev_release(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port *port =3D to_mikrobus_port(d=
ev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0idr_remove(&amp;mikrobus_port_idr, port-&gt;id);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(port);<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct device_type mikrobus_port_type =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.groups =3D mikrobus_port_groups,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.release =3D mikrobus_dev_release,<br>
&gt; +};<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_port_type);<br>
&gt; +<br>
&gt; +static int mikrobus_get_irq(struct mikrobus_port *port, int irqno,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (irqno) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_INT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq =3D gpiod_to_irq(port-&gt;int_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
<br>
Please fix your indentation here.=C2=A0 (And everywhere; I give<br>
an example of the proper way to do it below.)<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_RST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq =3D gpiod_to_irq(port-&gt;rst_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_PWM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq =3D gpiod_to_irq(port-&gt;pwm_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (irq &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Could no=
t get irq for irq type: %d&quot;, irqno);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq_set_irq_type(irq, irq_type);<br>
<br>
It shouldn&#39;t return an error, but please check the<br>
return value here.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return irq;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mikrobus_setup_gpio(struct gpio_desc *gpio, int gpio_state=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (gpio_state =3D=3D MIKROBUS_GPIO_UNUSED)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (gpio_state) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_INPUT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D gpiod_direction_input(gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_OUTPUT_HIGH:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D gpiod_direction_output(gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_OUTPUT_LOW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D gpiod_direction_output(gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void mikrobus_spi_device_delete(struct spi_master *master, uns=
igned int cs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char str[32];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snprintf(str, sizeof(str), &quot;%s.%u&quot;, dev=
_name(&amp;master-&gt;dev), cs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev =3D bus_find_device_by_name(&amp;spi_bus_type=
, NULL, str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_unregister_device=
(to_spi_device(dev));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_device(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static char *mikrobus_get_gpio_chip_name(struct mikrobus_port *port, =
int gpio)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_chip *gpiochip;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (gpio) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_INT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiochip =3D gpiod_to_chip(port-&gt;int_gpio);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0name =3D kmemdup(gpiochip-&gt;label, 40, GFP_KERN=
EL);<br>
<br>
Why 40?=C2=A0 Please use a symbolic constant so you can<br>
change it easily, and to give you a place to explain<br>
why 40 is the limit used.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_RST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiochip =3D gpiod_to_chip(port-&gt;rst_gpio);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0name =3D kmemdup(gpiochip-&gt;label, 40, GFP_KERN=
EL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_PWM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiochip =3D gpiod_to_chip(port-&gt;pwm_gpio);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0name =3D kmemdup(gpiochip-&gt;label, 40, GFP_KERN=
EL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return name;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mikrobus_get_gpio_hwnum(struct mikrobus_port *port, int gp=
io)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int hwnum;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_chip *gpiochip;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (gpio) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_INT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiochip =3D gpiod_to_chip(port-&gt;int_gpio);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0hwnum =3D desc_to_gpio(port-&gt;int_gpio) - gpioc=
hip-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_RST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiochip =3D gpiod_to_chip(port-&gt;rst_gpio);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0hwnum =3D desc_to_gpio(port-&gt;rst_gpio) - gpioc=
hip-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_GPIO_PWM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiochip =3D gpiod_to_chip(port-&gt;pwm_gpio);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0hwnum =3D desc_to_gpio(port-&gt;pwm_gpio) - gpioc=
hip-&gt;base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return hwnum;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void release_mikrobus_device(struct board_device_info *dev)<br=
>
<br>
We tend to follow a convention throughout the Greybus code<br>
that has the object name as the prefix for things you do<br>
to the object.=C2=A0 I don&#39;t know how consistent that is, but<br>
my suggestion would be that these functions would be named<br>
something more like:<br>
=C2=A0 =C2=A0 mikrobus_gpio_chip_name_get()<br>
=C2=A0 =C2=A0 mikrobus_gpio_hwnum_get()<br>
=C2=A0 =C2=A0 mikrobus_board_release_device_all()<br>
=C2=A0 =C2=A0 mikrobus_device_register()<br>
=C2=A0 =C2=A0 mikrobus_device_unregister()<br>
=C2=A0 =C2=A0 mikrobus_board_register()<br>
=C2=A0 =C2=A0 mikrobus_board_unregister()<br>
and so on.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_del(&amp;dev-&gt;links);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(dev);<br>
&gt; +}<br>
&gt; +<br>
<br>
(I skipped reviewing a lot here...)<br>
. . .<br>
<br>
&gt; diff --git a/drivers/misc/mikrobus/mikrobus_core.h b/drivers/misc/mikr=
obus/mikrobus_core.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..9684d315f564<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/mikrobus_core<br>
. . .<br>
<br>
&gt; diff --git a/drivers/misc/mikrobus/mikrobus_manifest.c b/drivers/misc/=
mikrobus/mikrobus_manifest.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..60ebca560f0d<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/mikrobus_manifest.c<br>
&gt; @@ -0,0 +1,390 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * mikroBUS manifest parsing, an<br>
&gt; + * extension to Greybus Manifest Parsing<br>
&gt; + * under drivers/greybus/manifest.c<br>
&gt; + *<br>
&gt; + * Copyright 2014-2015 Google Inc.<br>
&gt; + * Copyright 2014-2015 Linaro Ltd.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define pr_fmt(fmt) &quot;mikrobus_manifest: &quot; fmt<br>
&gt; +<br>
&gt; +#include &lt;linux/bits.h&gt;<br>
&gt; +#include &lt;linux/types.h&gt;<br>
&gt; +#include &lt;linux/property.h&gt;<br>
&gt; +#include &lt;linux/greybus/greybus_manifest.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;mikrobus_manifest.h&quot;<br>
&gt; +<br>
&gt; +struct manifest_desc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head links;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum greybus_descriptor_type type;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void release_manifest_descriptor(struct manifest_desc *descrip=
tor)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_del(&amp;descriptor-&gt;links);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(descriptor);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void release_manifest_descriptors(struct addon_board_info *inf=
o)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *next;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(descriptor, next, &amp;i=
nfo-&gt;manifest_descs, links)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release_manifest_desc=
riptor(descriptor);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int identify_descriptor(struct addon_board_info *info, struct =
greybus_descriptor *desc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size)<br>
&gt; +{<br>
<br>
I know it&#39;s technically acceptable now, but please limit your lines to<=
br>
80 characters in the Greybus code if possible.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_header *desc_header =3D=
 &amp;desc-&gt;header;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t desc_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t expected_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (size &lt; sizeof(*desc_header))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0desc_size =3D le16_to_cpu(desc_header-&gt;size);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (desc_size &gt; size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
<br>
Probably check if (desc_size !=3D size) here.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size =3D sizeof(*desc_header);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (desc_header-&gt;type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_STRING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_string);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D desc-&gt;string.length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size =3D ALIGN(expected_size, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
<br>
Your indentation is wrong here.=C2=A0 Please use:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (desc_header-&gt;type) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GREYBUS_TYPE_STRING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_size +=3D =
...;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case GREYBUS_TYPE_PROPERTY:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_PROPERTY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_property);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D desc-&gt;property.length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size =3D ALIGN(expected_size, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_DEVICE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_device);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_MIKROBUS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_mikrobus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_INTERFACE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_interface);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_CPORT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_cport);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_BUNDLE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_bundle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_INVALID:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0descriptor =3D kzalloc(sizeof(*descriptor), GFP_K=
ERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!descriptor)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0descriptor-&gt;size =3D desc_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0descriptor-&gt;data =3D (char *)desc + sizeof(*de=
sc_header);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0descriptor-&gt;type =3D desc_header-&gt;type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_add_tail(&amp;descriptor-&gt;links, &amp;inf=
o-&gt;manifest_descs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return desc_size;<br>
&gt; +}<br>
<br>
. . .<br>
<br>
&gt; +static int mikrobus_manifest_attach_device(struct addon_board_info *i=
nfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct greybus_descriptor_device *dev_desc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *dev;<br>
<br>
I would suggest something other than &quot;dev&quot; as the name of<br>
a board_device.=C2=A0 The use of &quot;dev&quot; for (struct device *)<br>
is pretty prevalent in the kernel, and so using it here<br>
can be more confusing than it has to be.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpiod_lookup_table *lookup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_property *desc_property=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 *prop_link;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 *gpio_desc_link;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dev)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;id =3D dev_desc-&gt;id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;drv_name =3D mikrobus_string_get(info, de=
v_desc-&gt;driver_stringid);<br>
<br>
This can return NULL.=C2=A0 You need to check for that, and free<br>
the board device you have already allocated.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;protocol =3D dev_desc-&gt;protocol;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;reg =3D dev_desc-&gt;reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;irq =3D dev_desc-&gt;irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;irq_type =3D dev_desc-&gt;irq_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;max_speed_hz =3D le32_to_cpu(dev_desc-&gt=
;max_speed_hz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;mode =3D dev_desc-&gt;mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;cs_gpio =3D dev_desc-&gt;cs_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;num_gpio_resources =3D dev_desc-&gt;num_g=
pio_resources;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;num_properties =3D dev_desc-&gt;num_prope=
rties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot;device %d , number of properties=3D=
%d , number of gpio resources=3D%d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;id, dev-&gt;num_properties, dev-&gt;num_g=
pio_resources);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;num_properties &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop_link =3D mikrobu=
s_property_link_get(info, dev_desc-&gt;prop_link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MI=
KROBUS_PROPERTY_TYPE_LINK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;properties =
=3D mikrobus_property_entry_get(info, prop_link, dev-&gt;num_properties);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;num_gpio_resources &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lookup =3D kzalloc(st=
ruct_size(lookup, table, dev-&gt;num_gpio_resources),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!lookup)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
<br>
You can&#39;t return without freeing your previously-allocated resources.<b=
r>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio_desc_link =3D mikrobus_property_link_get(inf=
o, dev_desc-&gt;gpio_link,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_GPIO);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; dev-&gt;num_gpio_resources; =
i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(d=
escriptor, &amp;info-&gt;manifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (descriptor-&gt;type !=3D GREYBUS_TYPE_PROPERTY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0desc_property =3D descriptor-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (desc_property-&gt;id =3D=3D gpio_desc_link[i]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lookup-&gt;table[i].chip_hwnum =3D *desc=
_property-&gt;value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lookup-&gt;table[i].con_id =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mikrobus_string_get(info, desc_property-=
&gt;propname_stringid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;gpio_lookup =3D lookup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_add_tail(&amp;dev-&gt;links, &amp;info-&gt;d=
evices);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mikrobus_manifest_parse_devices(struct addon_board_info *i=
nfo)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_device *desc_device;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *desc, *next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int devcount =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!list_empty(&amp;info-&gt;devices)))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
<br>
The manifest comes from outside the kernel=C2=A0 I might be misunderstandin=
g<br>
something, but you should not be using WARN_ON() if its content doesn&#39;t=
<br>
match what you expect.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(desc, next, &amp;info-&g=
t;manifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc-&gt;type !=
=3D GREYBUS_TYPE_DEVICE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc_device =3D desc-=
&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mikrobus_manifest_att=
ach_device(info, desc_device);<br>
<br>
You are ignoring the return value of mikrobus_manifest_attach_device().<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devcount++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return devcount;<br>
&gt; +}<br>
&gt; +<br>
&gt; +bool mikrobus_manifest_parse(struct addon_board_info *info, void *dat=
a,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size)<br>
<br>
You use &quot;board&quot; as the name of a &quot;board_info&quot; variable =
elsewhere.<br>
That is much more helpful than &quot;info&quot;.=C2=A0 Please use a consist=
ent<br>
naming convention for your variables of given types if possible.<br>
It makes it easier to follow the code.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_manifest *manifest;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_manifest_header *header;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor *desc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 manifest_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int dev_count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int desc_size;<br>
&gt; +<br>
<br>
Check the size before you bother checking anything else.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!list_empty(&amp;info-&gt;manifest_de=
scs)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (size &lt; sizeof(*header))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0manifest =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0header =3D &amp;manifest-&gt;header;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0manifest_size =3D le16_to_cpu(header-&gt;size);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (manifest_size !=3D size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
<br>
It would be helpful to report what the problem with the<br>
manifest is (here and in all cases).=C2=A0 Otherwise it&#39;s a<br>
little mysterious why adding a board fails.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (header-&gt;version_major &gt; MIKROBUS_VERSIO=
N_MAJOR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
<br>
Version checks!!!=C2=A0 This is good!=C2=A0 But the topic is of great<br>
interest to Greybus people!=C2=A0 Not sure we ever completely<br>
resolved that.=C2=A0 That&#39;s my only comment on this for now.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0desc =3D manifest-&gt;descriptors;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size -=3D sizeof(*header);<br>
<br>
Why aren&#39;t you using mikrobus_manifest_header_validate() here?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc_size =3D identif=
y_descriptor(info, desc, size);<br>
<br>
What you&#39;re really doing with identify_descriptor() is adding<br>
a valid descriptor to a board&#39;s list of descriptors.=C2=A0 I think<br>
the name of that function shoudl reflect that.=C2=A0 If it isn&#39;t<br>
identified, that&#39;s an error--but that&#39;s not the purpose of<br>
that function.=C2=A0 So maybe:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc_ =3D board_descriptor_add(board, desc, siz=
e);<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_size &lt; 0)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;invalid manifest descriptor&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
Your indentation of the return statement here is wrong.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D (struct grey=
bus_descriptor *)((char *)desc + desc_size);<br>
<br>
I don&#39;t know if this is better, but this could be:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D (void *)de=
sc + desc_size;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size -=3D desc_size;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_state_get(info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_count =3D mikrobus_manifest_parse_devices(inf=
o);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot; %s manifest parsed with %d device(=
s)\n&quot;, info-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;num_devices)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0release_manifest_descriptors(info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +size_t mikrobus_manifest_header_validate(void *data, size_t size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_manifest_header *header;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 manifest_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (size &lt; sizeof(*header))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0header =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0manifest_size =3D le16_to_cpu(header-&gt;size);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (header-&gt;version_major &gt; MIKROBUS_VERSIO=
N_MAJOR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return manifest_size;<br>
&gt; +}<br>
&gt; diff --git a/drivers/misc/mikrobus/mikrobus_manifest.h b/drivers/misc/=
mikrobus/mikrobus_manifest.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..a195d1c26493<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/mikrobus_manifest.h<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * mikroBUS manifest definition<br>
&gt; + * extension to Greybus Manifest Definition<br>
&gt; + *<br>
&gt; + * Copyright 2014-2015 Google Inc.<br>
&gt; + * Copyright 2014-2015 Linaro Ltd.<br>
&gt; + *<br>
&gt; + * Released under the GPLv2 and BSD licenses.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __MIKROBUS_MANIFEST_H<br>
&gt; +#define __MIKROBUS_MANIFEST_H<br>
&gt; +<br>
&gt; +#include &quot;mikrobus_core.h&quot;<br>
&gt; +<br>
&gt; +bool mikrobus_manifest_parse(struct addon_board_info *info, void *dat=
a,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size);<br>
&gt; +size_t mikrobus_manifest_header_validate(void *data, size_t size);<br=
>
&gt; +<br>
&gt; +#endif /* __MIKROBUS_MANIFEST_H */<br>
&gt; diff --git a/include/linux/greybus/greybus_manifest.h b/include/linux/=
greybus/greybus_manifest.h<br>
&gt; index 6e62fe478712..79c8cab9ef96 100644<br>
&gt; --- a/include/linux/greybus/greybus_manifest.h<br>
&gt; +++ b/include/linux/greybus/greybus_manifest.h<br>
&gt; @@ -23,6 +23,9 @@ enum greybus_descriptor_type {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GREYBUS_TYPE_STRING=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x02,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GREYBUS_TYPE_BUNDLE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x03,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GREYBUS_TYPE_CPORT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x04,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GREYBUS_TYPE_MIKROBUS=C2=A0 =C2=A0=3D 0x05,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GREYBUS_TYPE_PROPERTY=C2=A0 =C2=A0=3D 0x06,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GREYBUS_TYPE_DEVICE=C2=A0 =C2=A0 =C2=A0=3D 0x07,<=
br>
<br>
Please align your new values with the rest, for consistency.<br>
<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 enum greybus_protocol {<br>
&gt; @@ -151,6 +154,53 @@ struct greybus_descriptor_cport {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u8=C2=A0 =C2=A0 protocol_id;=C2=A0 =C2=A0 =
/* enum greybus_protocol */<br>
&gt;=C2=A0 } __packed;<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * A mikrobus descriptor is used to describe the details<br>
&gt; + * about the add-on board connected to the mikrobus port.<br>
&gt; + * It describes the number of indivdual devices on the<br>
&gt; + * add-on board and the default states of the GPIOs<br>
&gt; + */<br>
&gt; +struct greybus_descriptor_mikrobus {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 num_devices;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 rst_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 pwm_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 int_gpio_state;<br>
&gt; +} __packed;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * A property descriptor is used to pass named properties<br>
&gt; + * to device drivers through the unified device properties<br>
&gt; + * interface under linux/property.h<br>
&gt; + */<br>
&gt; +struct greybus_descriptor_property {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 propname_stringid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 value[0];<br>
&gt; +} __packed;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * A device descriptor is used to describe the<br>
&gt; + * details required by a add-on board device<br>
&gt; + * driver.<br>
&gt; + */<br>
&gt; +struct greybus_descriptor_device {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 driver_stringid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 num_properties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 protocol;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__le32 max_speed_hz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 num_gpio_resources;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 cs_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 irq_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 prop_link;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 gpio_link;<br>
&gt; +} __packed;<br>
&gt; +<br>
&gt;=C2=A0 struct greybus_descriptor_header {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__le16=C2=A0 size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u8=C2=A0 =C2=A0 type;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* enum greybus_descriptor_type */<br>
&gt; @@ -164,6 +214,9 @@ struct greybus_descriptor {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct greybus_d=
escriptor_interface=C2=A0 =C2=A0 =C2=A0interface;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct greybus_d=
escriptor_bundle=C2=A0 =C2=A0 =C2=A0 =C2=A0 bundle;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct greybus_d=
escriptor_cport=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cport;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct greybus_descri=
ptor_mikrobus=C2=A0 =C2=A0 =C2=A0 mikrobus;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct greybus_descri=
ptor_property=C2=A0 =C2=A0 =C2=A0 property;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct greybus_descri=
ptor_device=C2=A0 =C2=A0 =C2=A0 =C2=A0 device;<br>
<br>
We&#39;re going to need to talk about these things...=C2=A0 But I can&#39;t=
<br>
comment much more without learning more about the broader<br>
architecture.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Alex<br=
>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 } __packed;<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
_______________________________________________<br>
greybus-dev mailing list<br>
<a href=3D"mailto:greybus-dev@lists.linaro.org" target=3D"_blank">greybus-d=
ev@lists.linaro.org</a><br>
<a href=3D"https://lists.linaro.org/mailman/listinfo/greybus-dev" rel=3D"no=
referrer" target=3D"_blank">https://lists.linaro.org/mailman/listinfo/greyb=
us-dev</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><a href=3D"https://beag=
leboard.org/about/jkridner" target=3D"_blank">https://beagleboard.org/about=
/jkridner</a> - a 501c3 non-profit educating around open hardware computing=
</div></div>

--0000000000001dd7d705ab5ba997--

--===============6861481175408736008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============6861481175408736008==--
