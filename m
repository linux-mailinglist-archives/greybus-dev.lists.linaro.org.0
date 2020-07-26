Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC922E2C1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jul 2020 23:36:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D024266628
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jul 2020 21:36:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BA7D166631; Sun, 26 Jul 2020 21:36:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MIME_HTML_MOSTLY,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4832B66597;
	Sun, 26 Jul 2020 21:33:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 717AF617F1
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 17:23:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5731966539; Sun, 26 Jul 2020 17:23:55 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by lists.linaro.org (Postfix) with ESMTPS id 6CBFD617F1
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 17:23:45 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p25so7142186vsg.4
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 10:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rS3DqzczCFBi90tXw7IlwyCi+Qh97WH5VflrN4GjEDE=;
 b=lkMj6UiV3JKQZKQn/4BWEvGbJkmP5agGC/SJR+vwR3xvHnNnI3Jl/yNxCCA0AQo8YC
 um19jCbWQXnTGSTZixSbak1aMKvaBM8tkI6POsmr9QkODty9apSxh9gZ2+P+lqNDsZSL
 Nj843owD8y+ATVN5APIMfrMJjDtKzFgBzOZSiKywbjKC/TUhuSmkDW6DnXaKUexUELfK
 BTNWqRdEgVTl/68NEO4QlmfAXojLIeRomFwHuJLByKXrGPJ/lcOny9iXWOyUaCTyb1eM
 bAe/ZVYEdWGyU67WjwwCGpWc5Kmol5baobBzwg8+RsJMqC1jXb9NZbBm+F6AEt87L0dF
 LQog==
X-Gm-Message-State: AOAM530T1gwJE4NwE4InHbd7tJLGXumo8ibnZvwSwHLVjDghctW6f9wl
 d70v2TFFgAvf7L5ZpmeVQvAcIAmwdoMM3RqSEOg=
X-Google-Smtp-Source: ABdhPJyt2gVx0oTcnO9ivXdmcNa9TtILR7L9wfFx4d3NJxHNz3LhBsOwi/Nq5DnYsWJwpD6BHvR5WMKbRIBYuCdKQp8=
X-Received: by 2002:a67:8a4a:: with SMTP id m71mr14562933vsd.59.1595784224433; 
 Sun, 26 Jul 2020 10:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200724120637.GA427284@vaishnav-VirtualBox>
 <b8887d88-8c3b-ef54-f24d-190b00697e97@linaro.org>
In-Reply-To: <b8887d88-8c3b-ef54-f24d-190b00697e97@linaro.org>
From: Jason Kridner <jkridner@beagleboard.org>
Date: Sun, 26 Jul 2020 13:23:33 -0400
Message-ID: <CA+T6QPnYrDfFzHr+kCHZW2VhU1BDYdD+3x5SUUqP5wUZ1Gdakg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6656361849329247820=="
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

--===============6656361849329247820==
Content-Type: multipart/alternative; boundary="000000000000d5ec1605ab5b77cc"

--000000000000d5ec1605ab5b77cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2020 at 8:48 AM Alex Elder <elder@linaro.org> wrote:

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
> Vaishnav, I am finally looking at this a little more closely
> today.  More than anything I want to compliment you on all
> this work.  I think it looks like a great use of Greybus for
> essentially its intended purpose, and I would love to see
> it extended as needed to support what you're doing here.
>
> At first glance your patch looks good, but I want to take the
> time to give it a thorough review.  Unfortunately I did not
> follow your progress on the GSoC project (which you posted
> about last year here), and have not followed any discussion
> since then, so it's taking me a little time to come up to speed
> on it.  I'm hoping you might help me (and others) do this more
> quickly.
>
> I am scanning through some of the materials online and I find
> there is quite a lot.  That includes information about both
> your project and about mikroBUS.  Zeroing in on things that
> fairly concisely describe the way things really work would be
> very valuable.  Can you point me directly at something that
> gives an overview of both the hardware and software
> architecture (specifically as it's used with Greybus)?  If
> not, I'm open to finding other ways to get in synch.  I'll
> expand on this a little more below.


The exact implementation isn=E2=80=99t so critical, but understanding that =
using
Greybus to talk to devices implementing the mikroBUS standard is. One
instance of the project is visible on my personal github account, but some
documentation updates and additional roadmap/branding items would be
helpful. I don=E2=80=99t want it to show up on widely distributed blogs yet=
, so
I=E2=80=99ll send anyone that contacts me directly the publicly visible URL=
. Please
don=E2=80=99t make me take it private again by getting it on a popular blog=
 before
we can refine our message.


>
> This isn't strictly necessary, but if I wanted to reproduce the
> hardware setup you use to validate this code, what hardware
> is required?  For example, is it possible to use a BeagleBone Black
> with a MikroBus Cape for testing, or must a PocktBeagle be used?
> Is there one or several MikroBus clickboards that would be the
> best for basic testing?


Just about any Linux board with a mikroBUS socket can be used to reproduce
the function, though a PocketBeagle plus TechLab cape is the primary
development vehicle. Initial Greybus transport integration will be done
with a limited bandwidth 2.4GHz 802.15.4 transport using gb-netlink and
gbridge. Hardware is an ATUSB and CC1352R Launchpad with Click 2
Boosterpack.


>
> Can you provide a short summary of why the Greybus manifest
> format needed to be extended?  Can you summarize how a mikroBUS
> add-on board differs from an Ara module?  And what they have in
> common?
>
> This patch is an RFC, and you say that v3 of the mikroBUS spec
> is being developed.  Is your plan to have the "real" code (when
> you submit it) adhere to the newer version of the spec?  Are
> there specific things that you expect will be included in v3
> that will how the driver works (compared to this RFC)?
>
> Please realize I'm asking these questions so I can be more
> effective in evaluating what you're doing here.  I'd like to
> provide feedback not just on the code, but on the design that
> underlies it, and for that I need to get better informed.  My
> hope is that you can help me find or gather that information
> as quickly as possible.
>
> And now I'll go give a quick initial review of the code...
>
> Thanks.
>
>                                         -Alex
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
> >
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
> > +
> > +
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
> > +
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
> > +             pr_err("add_port: incorrect config data received: %s\n",
> buf);
> > +             return -EINVAL;
> > +     }
> > +     mikrobus_register_port_config((void *)buf);
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
> > +     if (res < 1) {
> > +             pr_err("delete_port: cannot parse mikrobus port ID\n");
> > +             return -EINVAL;
> > +     }
> > +     if (!idr_find(&mikrobus_port_idr, id)) {
> > +             pr_err("attempting to delete unregistered port [%d]\n",
> id);
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
> > +static int mikrobus_port_scan_eeprom(struct mikrobus_port *port)
> > +{
> > +     char header[12];
> > +     struct addon_board_info *board;
> > +     int manifest_size;
> > +     int retval;
> > +     char *buf;
> > +
> > +     nvmem_device_read(port->eeprom, 0, 12, header);
> > +     manifest_size =3D mikrobus_manifest_header_validate(header, 12);
> > +     if (manifest_size > 0) {
> > +             buf =3D kzalloc(manifest_size, GFP_KERNEL);
> > +             nvmem_device_read(port->eeprom, 0, manifest_size, buf);
> > +             board =3D kzalloc(sizeof(*board), GFP_KERNEL);
> > +             if (!board)
> > +                     return -ENOMEM;
> > +             INIT_LIST_HEAD(&board->manifest_descs);
> > +             INIT_LIST_HEAD(&board->devices);
> > +             retval =3D mikrobus_manifest_parse(board, (void *)buf,
> manifest_size);
> > +             if (!retval) {
> > +                     pr_err("failed to parse manifest, size: %d",
> manifest_size);
> > +                     return -EINVAL;
> > +             }
> > +             retval =3D mikrobus_register_board(port, board);
> > +             if (retval) {
> > +                     pr_err("failed to register board: %s",
> board->name);
> > +                     return -EINVAL;
> > +             }
> > +             kfree(buf);
> > +     } else {
> > +             pr_err("inavlide manifest port %d", port->id);
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
> > +{
> > +     list_del(&dev->links);
> > +     kfree(dev);
> > +}
> > +
> > +static void release_board_devices(struct addon_board_info *info)
> > +{
> > +     struct board_device_info *dev;
> > +     struct board_device_info *next;
> > +
> > +     list_for_each_entry_safe(dev, next, &info->devices, links)
> > +             release_mikrobus_device(dev);
> > +}
> > +
> > +static int mikrobus_register_device(struct mikrobus_port *port,
> > +                                     struct board_device_info *dev,
> char *board_name)
> > +{
> > +     struct i2c_board_info *i2c;
> > +     struct spi_board_info *spi;
> > +     struct gpiod_lookup_table *lookup;
> > +     char devname[40];
> > +     int i;
> > +
> > +     pr_info(" registering device : %s\n", dev->drv_name);
> > +
> > +     if (dev->gpio_lookup !=3D NULL) {
> > +             lookup =3D dev->gpio_lookup;
> > +             if (dev->protocol =3D=3D MIKROBUS_PROTOCOL_SPI) {
> > +                     snprintf(devname, sizeof(devname), "%s.%u",
> > +                             dev_name(&port->spi_mstr->dev), dev->reg)=
;
> > +                     lookup->dev_id =3D kmemdup(devname, 40, GFP_KERNE=
L);
> > +             } else if (dev->protocol =3D=3D MIKROBUS_PROTOCOL_I2C)
> > +                     lookup->dev_id =3D dev->drv_name;
> > +             pr_info(" adding lookup table : %s\n", lookup->dev_id);
> > +             for (i =3D 0; i < dev->num_gpio_resources; i++) {
> > +                     lookup->table[i].key =3D
> > +                     mikrobus_get_gpio_chip_name(port,
> lookup->table[i].chip_hwnum);
> > +                     lookup->table[i].chip_hwnum =3D
> > +                     mikrobus_get_gpio_hwnum(port,
> lookup->table[i].chip_hwnum);
> > +                     lookup->table[i].flags =3D GPIO_ACTIVE_HIGH;
> > +             }
> > +             gpiod_add_lookup_table(lookup);
> > +     }
> > +     switch (dev->protocol) {
> > +     case MIKROBUS_PROTOCOL_SPI:
> > +     spi =3D kzalloc(sizeof(*spi), GFP_KERNEL);
> > +     if (!spi)
> > +             return -ENOMEM;
> > +     strncpy(spi->modalias, dev->drv_name, sizeof(spi->modalias) - 1);
> > +     if (dev->irq)
> > +             spi->irq =3D mikrobus_get_irq(port, dev->irq, dev->irq_ty=
pe);
> > +     if (dev->properties)
> > +             spi->properties =3D dev->properties;
> > +     spi->chip_select =3D dev->reg;
> > +     spi->max_speed_hz =3D dev->max_speed_hz;
> > +     spi->mode =3D dev->mode;
> > +     mikrobus_spi_device_delete(port->spi_mstr, dev->reg);
> > +     dev->dev_client =3D (void *)spi_new_device(port->spi_mstr, spi);
> > +     break;
> > +     case MIKROBUS_PROTOCOL_I2C:
> > +     i2c =3D kzalloc(sizeof(*i2c), GFP_KERNEL);
> > +     if (!i2c)
> > +             return -ENOMEM;
> > +     strncpy(i2c->type, dev->drv_name, sizeof(i2c->type) - 1);
> > +     if (dev->irq)
> > +             i2c->irq =3D mikrobus_get_irq(port, dev->irq, dev->irq_ty=
pe);
> > +     if (dev->properties)
> > +             i2c->properties =3D dev->properties;
> > +     i2c->addr =3D dev->reg;
> > +     dev->dev_client =3D (void *)i2c_new_client_device(port->i2c_adap,
> i2c);
> > +     break;
> > +     case MIKROBUS_PROTOCOL_UART:
> > +     pr_info("SERDEV devices support not yet added");
> > +     break;
> > +     default:
> > +     return -EINVAL;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static void mikrobus_unregister_device(struct mikrobus_port *port,
> struct board_device_info *dev,
> > +
>      char *board_name)
> > +{
> > +     pr_info(" removing device : %s\n", dev->drv_name);
> > +     if (dev->gpio_lookup !=3D NULL) {
> > +             gpiod_remove_lookup_table(dev->gpio_lookup);
> > +             kfree(dev->gpio_lookup);
> > +     }
> > +     if (dev->properties !=3D NULL)
> > +             kfree(dev->properties);
> > +     switch (dev->protocol) {
> > +     case MIKROBUS_PROTOCOL_SPI:
> > +     spi_unregister_device((struct spi_device *)dev->dev_client);
> > +     break;
> > +     case MIKROBUS_PROTOCOL_I2C:
> > +     i2c_unregister_device((struct i2c_client *)dev->dev_client);
> > +     break;
> > +     case MIKROBUS_PROTOCOL_UART:
> > +     pr_err("SERDEV devices support not yet added");
> > +     break;
> > +     }
> > +}
> > +
> > +int mikrobus_register_board(struct mikrobus_port *port,      struct
> addon_board_info *board)
> > +{
> > +     struct board_device_info *devinfo;
> > +     struct board_device_info *next;
> > +     int retval;
> > +
> > +     if (WARN_ON(list_empty(&board->devices)))
> > +             return false;
> > +
> > +     retval =3D mikrobus_setup_gpio(port->pwm_gpio,
> board->pwm_gpio_state);
> > +     if (retval) {
> > +             pr_err("mikrobus_setup_gpio : can't setup pwm gpio state:
> (%d)\n", retval);
> > +             return retval;
> > +     }
> > +     retval =3D mikrobus_setup_gpio(port->int_gpio,
> board->int_gpio_state);
> > +     if (retval) {
> > +             pr_err("mikrobus_setup_gpio : can't setup int gpio state:
> (%d)\n", retval);
> > +             return retval;
> > +     }
> > +     retval =3D mikrobus_setup_gpio(port->rst_gpio,
> board->rst_gpio_state);
> > +     if (retval) {
> > +             pr_err("mikrobus_setup_gpio : can't setup rst gpio state:
> (%d)\n", retval);
> > +             return retval;
> > +     }
> > +     list_for_each_entry_safe(devinfo, next, &board->devices, links)
> > +             mikrobus_register_device(port, devinfo, board->name);
> > +     port->board =3D board;
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(mikrobus_register_board);
> > +
> > +void mikrobus_unregister_board(struct mikrobus_port *port, struct
> addon_board_info *board)
> > +{
> > +     struct board_device_info *devinfo;
> > +     struct board_device_info *next;
> > +
> > +     if (WARN_ON(list_empty(&board->devices)))
> > +             return;
> > +     port->board =3D NULL;
> > +     list_for_each_entry_safe(devinfo, next, &board->devices, links)
> > +             mikrobus_unregister_device(port, devinfo, board->name);
> > +     release_board_devices(board);
> > +     kfree(board);
> > +     port->board =3D NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(mikrobus_unregister_board);
> > +
> > +int mikrobus_register_port_config(struct mikrobus_port_config *cfg)
> > +{
> > +     struct mikrobus_port *port;
> > +     int retval;
> > +
> > +     if (WARN_ON(!is_registered))
> > +             return -EAGAIN;
> > +     port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> > +     if (!port)
> > +             return -ENOMEM;
> > +     port->pwm_gpio =3D gpio_to_desc(cfg->pwm_gpio_nr);
> > +     port->int_gpio =3D gpio_to_desc(cfg->int_gpio_nr);
> > +     port->rst_gpio =3D gpio_to_desc(cfg->rst_gpio_nr);
> > +     port->spi_mstr =3D spi_busnum_to_master(cfg->spi_master_nr);
> > +     port->i2c_adap =3D i2c_get_adapter(cfg->i2c_adap_nr);
> > +     retval =3D mikrobus_register_port(port);
> > +     if (retval) {
> > +             pr_err("port : can't register port from config (%d)\n",
> retval);
> > +             return retval;
> > +     }
> > +     return retval;
> > +}
> > +EXPORT_SYMBOL_GPL(mikrobus_register_port_config);
> > +
> > +static struct i2c_board_info mikrobus_eeprom_info =3D {
> > +     I2C_BOARD_INFO("24c32", ATMEL_24C32_I2C_ADDR),
> > +};
> > +
> > +static int mikrobus_port_probe_eeprom(struct mikrobus_port *port)
> > +{
> > +     struct i2c_client *eeprom_client;
> > +     struct nvmem_device *eeprom;
> > +     char dev_name[40];
> > +
> > +     eeprom_client =3D i2c_new_client_device(port->i2c_adap,
> &mikrobus_eeprom_info);
> > +     if (!IS_ERR(eeprom_client)) {
> > +             pr_info(" mikrobus port %d default eeprom is probed at
> %02x\n", port->id,
> > +
>  eeprom_client->addr);
> > +             snprintf(dev_name, sizeof(dev_name), "%d-%04x0",
> port->i2c_adap->nr,
> > +                              eeprom_client->addr);
> > +             eeprom =3D nvmem_device_get(&eeprom_client->dev, dev_name=
);
> > +             if (IS_ERR(eeprom)) {
> > +                     pr_err(" mikrobus port %d eeprom nvmem device
> probe failed\n", port->id);
> > +                     i2c_unregister_device(eeprom_client);
> > +                     port->eeprom =3D NULL;
> > +                     return 0;
> > +             }
> > +     } else {
> > +             pr_info(" mikrobus port %d default eeprom probe failed\n"=
,
> port->id);
> > +             return 0;
> > +     }
> > +     port->eeprom =3D eeprom;
> > +     port->eeprom_client =3D eeprom_client;
> > +     return 0;
> > +}
> > +
> > +int mikrobus_register_port(struct mikrobus_port *port)
> > +{
> > +     int retval;
> > +     int id;
> > +
> > +     if (WARN_ON(!is_registered))
> > +             return -EAGAIN;
> > +     id =3D idr_alloc(&mikrobus_port_idr, port, 0, 0, GFP_KERNEL);
> > +     if (id < 0)
> > +             return id;
> > +     port->id =3D id;
> > +     port->dev.bus =3D &mikrobus_bus_type;
> > +     port->dev.type =3D &mikrobus_port_type;
> > +     strncpy(port->name, "mikrobus-port", sizeof(port->name) - 1);
> > +     dev_set_name(&port->dev, "mikrobus-%d", port->id);
> > +     pr_info("registering port mikrobus-%d\n ", port->id);
> > +     retval =3D device_register(&port->dev);
> > +     if (retval) {
> > +             pr_err("port '%d': can't register device (%d)\n",
> port->id, retval);
> > +             put_device(&port->dev);
> > +             return retval;
> > +     }
> > +     retval =3D class_compat_create_link(mikrobus_port_compat_class,
> &port->dev,
> > +
>  port->dev.parent);
> > +     if (retval)
> > +             dev_warn(&port->dev, "failed to create compatibility clas=
s
> link\n");
> > +     if (!port->eeprom) {
> > +             pr_info("mikrobus port %d eeprom empty probing default
> eeprom\n", port->id);
> > +             retval =3D mikrobus_port_probe_eeprom(port);
> > +     }
> > +     if (port->eeprom) {
> > +             retval =3D mikrobus_port_scan_eeprom(port);
> > +             if (retval)
> > +                     dev_warn(&port->dev, "failed to register board
> from manifest\n");
> > +     }
> > +     return retval;
> > +}
> > +EXPORT_SYMBOL_GPL(mikrobus_register_port);
> > +
> > +void mikrobus_del_port(struct mikrobus_port *port)
> > +{
> > +     struct mikrobus_port *found;
> > +
> > +     found =3D idr_find(&mikrobus_port_idr, port->id);
> > +     if (found !=3D port) {
> > +             pr_err("attempting to delete unregistered port [%s]\n",
> port->name);
> > +             return;
> > +     }
> > +     if (port->board !=3D NULL) {
> > +             pr_err("attempting to delete port with registered boards,
> port [%s]\n",
> > +
>  port->name);
> > +             return;
> > +     }
> > +
> > +     if (port->eeprom) {
> > +             nvmem_device_put(port->eeprom);
> > +             i2c_unregister_device(port->eeprom_client);
> > +     }
> > +
> > +     class_compat_remove_link(mikrobus_port_compat_class, &port->dev,
> > +                                                     port->dev.parent)=
;
> > +     device_unregister(&port->dev);
> > +     idr_remove(&mikrobus_port_idr, port->id);
> > +     memset(&port->dev, 0, sizeof(port->dev));
> > +}
> > +EXPORT_SYMBOL_GPL(mikrobus_del_port);
> > +
> > +static int __init mikrobus_init(void)
> > +{
> > +     int retval;
> > +
> > +     retval =3D bus_register(&mikrobus_bus_type);
> > +     if (retval) {
> > +             pr_err("bus_register failed (%d)\n", retval);
> > +             return retval;
> > +     }
> > +     mikrobus_port_compat_class =3D
> class_compat_register("mikrobus-port");
> > +     if (!mikrobus_port_compat_class) {
> > +             pr_err("class_compat register failed (%d)\n", retval);
> > +             retval =3D -ENOMEM;
> > +             goto class_err;
> > +     }
> > +     is_registered =3D true;
> > +     return 0;
> > +class_err:
> > +     bus_unregister(&mikrobus_bus_type);
> > +     idr_destroy(&mikrobus_port_idr);
> > +     is_registered =3D false;
> > +     return retval;
> > +}
> > +subsys_initcall(mikrobus_init);
> > +
> > +static void __exit mikrobus_exit(void)
> > +{
> > +     bus_unregister(&mikrobus_bus_type);
> > +     class_compat_unregister(mikrobus_port_compat_class);
> > +     idr_destroy(&mikrobus_port_idr);
> > +}
> > +module_exit(mikrobus_exit);
> > +
> > +MODULE_AUTHOR("Vaishnav M A <vaishnav@beagleboard.org>");
> > +MODULE_DESCRIPTION("mikroBUS main module");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/misc/mikrobus/mikrobus_core.h
> b/drivers/misc/mikrobus/mikrobus_core.h
> > new file mode 100644
> > index 000000000000..9684d315f564
> > --- /dev/null
> > +++ b/drivers/misc/mikrobus/mikrobus_core.h
> > @@ -0,0 +1,130 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * mikroBUS Driver for instantiating add-on
> > + * board devices with an identifier EEPROM
> > + *
> > + * Copyright 2020 Vaishnav M A, BeagleBoard.org Foundation.
> > + */
> > +
> > +#ifndef __MIKROBUS_H
> > +#define __MIKROBUS_H
> > +
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/i2c.h>
> > +#include <linux/gpio.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/idr.h>
> > +#include <linux/init.h>
> > +#include <linux/jump_label.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/serdev.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
> > +
> > +#define MIKROBUS_VERSION_MAJOR 0x00
> > +#define MIKROBUS_VERSION_MINOR 0x02
> > +
> > +extern struct bus_type mikrobus_bus_type;
> > +extern struct device_type mikrobus_port_type;
> > +
> > +enum mikrobus_property_type {
> > +     MIKROBUS_PROPERTY_TYPE_LINK =3D 0x00,
> > +     MIKROBUS_PROPERTY_TYPE_GPIO =3D 0x01,
> > +     MIKROBUS_PROPERTY_TYPE_U8 =3D 0x02,
> > +     MIKROBUS_PROPERTY_TYPE_U16 =3D 0x03,
> > +     MIKROBUS_PROPERTY_TYPE_U32 =3D 0x04,
> > +     MIKROBUS_PROPERTY_TYPE_U64 =3D 0x05,
> > +};
> > +
> > +enum mikrobus_gpio_pin {
> > +     MIKROBUS_GPIO_INVALID =3D 0x00,
> > +     MIKROBUS_GPIO_INT =3D 0x01,
> > +     MIKROBUS_GPIO_RST =3D 0x02,
> > +     MIKROBUS_GPIO_PWM =3D 0x03,
> > +};
> > +
> > +enum mikrobus_protocol {
> > +     MIKROBUS_PROTOCOL_SPI =3D 0x01,
> > +     MIKROBUS_PROTOCOL_I2C =3D 0x02,
> > +     MIKROBUS_PROTOCOL_UART =3D 0x03,
> > +     MIKROBUS_PROTOCOL_SPI_GPIOCS =3D 0x04,
> > +     MIKROBUS_PROTOCOL_I2C_MUX =3D 0x05
> > +};
> > +
> > +enum mikrobus_gpio_state {
> > +     MIKROBUS_GPIO_UNUSED =3D 0x00,
> > +     MIKROBUS_GPIO_INPUT =3D 0x01,
> > +     MIKROBUS_GPIO_OUTPUT_HIGH =3D 0x02,
> > +     MIKROBUS_GPIO_OUTPUT_LOW =3D 0x03,
> > +};
> > +
> > +struct mikrobus_port_config {
> > +     __u8 i2c_adap_nr;
> > +     __u8 spi_master_nr;
> > +     __u8 serdev_ctlr_nr;
> > +     __u8 rst_gpio_nr;
> > +     __u8 pwm_gpio_nr;
> > +     __u8 int_gpio_nr;
> > +} __packed;
> > +
> > +struct board_device_info {
> > +     struct list_head links;
> > +     int id;
> > +     char *drv_name;
> > +     unsigned short protocol;
> > +     unsigned short reg;
> > +     u32 max_speed_hz;
> > +     unsigned int mode;
> > +     int irq;
> > +     int irq_type;
> > +     int cs_gpio;
> > +     unsigned short num_gpio_resources;
> > +     unsigned short num_properties;
> > +     struct property_entry *properties;
> > +     struct gpiod_lookup_table *gpio_lookup;
> > +     void *dev_client;
> > +};
> > +
> > +struct addon_board_info {
> > +     char *name;
> > +     unsigned short num_devices;
> > +     unsigned short rst_gpio_state;
> > +     unsigned short pwm_gpio_state;
> > +     unsigned short int_gpio_state;
> > +     struct list_head manifest_descs;
> > +     struct list_head devices;
> > +};
> > +
> > +struct mikrobus_port {
> > +     char name[48];
> > +     struct module *owner;
> > +     struct device dev;
> > +     int id;
> > +     struct gpio_desc *pwm_gpio;
> > +     struct gpio_desc *int_gpio;
> > +     struct gpio_desc *rst_gpio;
> > +     struct spi_master *spi_mstr;
> > +     struct i2c_adapter *i2c_adap;
> > +     struct addon_board_info *board;
> > +     struct i2c_client *eeprom_client;
> > +     struct nvmem_device *eeprom;
> > +};
> > +#define to_mikrobus_port(d) container_of(d, struct mikrobus_port, dev)
> > +
> > +int mikrobus_register_board(struct mikrobus_port *port,
> > +                                                     struct
> addon_board_info *board);
> > +void mikrobus_unregister_board(struct mikrobus_port *port,
> > +                                                        struct
> addon_board_info *board);
> > +int mikrobus_register_port_config(struct mikrobus_port_config *cfg);
> > +int mikrobus_register_port(struct mikrobus_port *port);
> > +void mikrobus_del_port(struct mikrobus_port *port);
> > +
> > +#endif /* __MIKROBUS_H */
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
> > +     expected_size =3D sizeof(*desc_header);
> > +     switch (desc_header->type) {
> > +     case GREYBUS_TYPE_STRING:
> > +     expected_size +=3D sizeof(struct greybus_descriptor_string);
> > +     expected_size +=3D desc->string.length;
> > +     expected_size =3D ALIGN(expected_size, 4);
> > +     break;
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
> > +
> > +static char *mikrobus_string_get(struct addon_board_info *info, u8
> string_id)
> > +{
> > +     struct greybus_descriptor_string *desc_string;
> > +     struct manifest_desc *descriptor;
> > +     bool found =3D false;
> > +     char *string;
> > +
> > +     if (!string_id)
> > +             return NULL;
> > +
> > +     list_for_each_entry(descriptor, &info->manifest_descs, links) {
> > +             if (descriptor->type !=3D GREYBUS_TYPE_STRING)
> > +                     continue;
> > +             desc_string =3D descriptor->data;
> > +             if (desc_string->id =3D=3D string_id) {
> > +                     found =3D true;
> > +                     break;
> > +             }
> > +     }
> > +     if (!found)
> > +             return ERR_PTR(-ENOENT);
> > +     string =3D kmemdup(&desc_string->string, desc_string->length + 1,
> GFP_KERNEL);
> > +     if (!string)
> > +             return ERR_PTR(-ENOMEM);
> > +     string[desc_string->length] =3D '\0';
> > +     return string;
> > +}
> > +
> > +static void mikrobus_state_get(struct addon_board_info *info)
> > +{
> > +     struct greybus_descriptor_mikrobus *mikrobus;
> > +     struct greybus_descriptor_interface *interface;
> > +     struct manifest_desc *descriptor;
> > +     bool found =3D false;
> > +
> > +     list_for_each_entry(descriptor, &info->manifest_descs, links) {
> > +             if (descriptor->type =3D=3D GREYBUS_TYPE_MIKROBUS) {
> > +                     mikrobus =3D descriptor->data;
> > +                     found =3D true;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (found) {
> > +             info->num_devices =3D mikrobus->num_devices;
> > +             info->rst_gpio_state =3D mikrobus->rst_gpio_state;
> > +             info->pwm_gpio_state =3D mikrobus->pwm_gpio_state;
> > +             info->int_gpio_state =3D mikrobus->int_gpio_state;
> > +     } else {
> > +             info->num_devices =3D 1;
> > +             info->rst_gpio_state =3D MIKROBUS_GPIO_UNUSED;
> > +             info->pwm_gpio_state =3D MIKROBUS_GPIO_UNUSED;
> > +             info->int_gpio_state =3D MIKROBUS_GPIO_UNUSED;
> > +     }
> > +
> > +     list_for_each_entry(descriptor, &info->manifest_descs, links) {
> > +             if (descriptor->type =3D=3D GREYBUS_TYPE_INTERFACE) {
> > +                     interface =3D descriptor->data;
> > +                     break;
> > +             }
> > +     }
> > +     info->name =3D mikrobus_string_get(info,
> interface->product_stringid);
> > +}
> > +
> > +static struct property_entry *
> > +mikrobus_property_entry_get(struct addon_board_info *info, u8
> *prop_link,
> > +                                                     int num_propertie=
s)
> > +{
> > +     struct greybus_descriptor_property *desc_property;
> > +     struct manifest_desc *descriptor;
> > +     struct property_entry *properties;
> > +     int i;
> > +     char *prop_name;
> > +     bool found =3D false;
> > +     u8 *val_u8;
> > +     u16 *val_u16;
> > +     u32 *val_u32;
> > +     u64 *val_u64;
> > +
> > +     properties =3D kcalloc(num_properties, sizeof(*properties),
> GFP_KERNEL);
> > +     if (!properties)
> > +             return ERR_PTR(-ENOMEM);
> > +     for (i =3D 0; i < num_properties; i++) {
> > +             list_for_each_entry(descriptor, &info->manifest_descs,
> links) {
> > +                     if (descriptor->type !=3D GREYBUS_TYPE_PROPERTY)
> > +                             continue;
> > +                     desc_property =3D descriptor->data;
> > +                     if (desc_property->id =3D=3D prop_link[i]) {
> > +                             found =3D true;
> > +                             break;
> > +                     }
> > +             }
> > +             if (!found)
> > +                     return ERR_PTR(-ENOENT);
> > +             prop_name =3D mikrobus_string_get(info,
> desc_property->propname_stringid);
> > +             switch (desc_property->type) {
> > +             case MIKROBUS_PROPERTY_TYPE_U8:
> > +             val_u8 =3D kmemdup(&desc_property->value,
> > +                             (desc_property->length) * sizeof(u8),
> GFP_KERNEL);
> > +             if (desc_property->length =3D=3D 1)
> > +                     properties[i] =3D PROPERTY_ENTRY_U8(prop_name,
> *val_u8);
> > +             else
> > +                     properties[i] =3D PROPERTY_ENTRY_U8_ARRAY_LEN(
> > +                             prop_name, (void *)desc_property->value,
> desc_property->length);
> > +             break;
> > +             case MIKROBUS_PROPERTY_TYPE_U16:
> > +             val_u16 =3D kmemdup(&desc_property->value,
> > +                                     (desc_property->length) *
> sizeof(u16), GFP_KERNEL);
> > +             if (desc_property->length =3D=3D 1)
> > +                     properties[i] =3D PROPERTY_ENTRY_U16(prop_name,
> *val_u16);
> > +             else
> > +                     properties[i] =3D PROPERTY_ENTRY_U16_ARRAY_LEN(
> > +                             prop_name, (void *)desc_property->value,
> desc_property->length);
> > +             break;
> > +             case MIKROBUS_PROPERTY_TYPE_U32:
> > +             val_u32 =3D kmemdup(&desc_property->value,
> > +                                     (desc_property->length) *
> sizeof(u32), GFP_KERNEL);
> > +             if (desc_property->length =3D=3D 1)
> > +                     properties[i] =3D PROPERTY_ENTRY_U32(prop_name,
> *val_u32);
> > +             else
> > +                     properties[i] =3D PROPERTY_ENTRY_U32_ARRAY_LEN(
> > +                     prop_name, (void *)desc_property->value,
> desc_property->length);
> > +             break;
> > +             case MIKROBUS_PROPERTY_TYPE_U64:
> > +             val_u64 =3D kmemdup(&desc_property->value,
> > +                                             (desc_property->length) *
> sizeof(u64), GFP_KERNEL);
> > +             if (desc_property->length =3D=3D 1)
> > +                     properties[i] =3D PROPERTY_ENTRY_U64(prop_name,
> *val_u64);
> > +             else
> > +                     properties[i] =3D PROPERTY_ENTRY_U64_ARRAY_LEN(
> > +                             prop_name, (void *)desc_property->value,
> desc_property->length);
> > +             break;
> > +             default:
> > +             return ERR_PTR(-EINVAL);
> > +             }
> > +     }
> > +     return properties;
> > +}
> > +
> > +static u8 *mikrobus_property_link_get(struct addon_board_info *info, u=
8
> prop_id,
> > +
>  u8 prop_type)
> > +{
> > +     struct greybus_descriptor_property *desc_property;
> > +     struct manifest_desc *descriptor;
> > +     bool found =3D false;
> > +     u8 *val_u8;
> > +
> > +     if (!prop_id)
> > +             return NULL;
> > +     list_for_each_entry(descriptor, &info->manifest_descs, links) {
> > +             if (descriptor->type !=3D GREYBUS_TYPE_PROPERTY)
> > +                     continue;
> > +             desc_property =3D descriptor->data;
> > +             if (desc_property->id =3D=3D prop_id && desc_property->ty=
pe =3D=3D
> prop_type) {
> > +                     found =3D true;
> > +                     break;
> > +             }
> > +     }
> > +     if (!found)
> > +             return ERR_PTR(-ENOENT);
> > +     val_u8 =3D kmemdup(&desc_property->value, desc_property->length,
> GFP_KERNEL);
> > +     return val_u8;
> > +}
> > +
> > +static int mikrobus_manifest_attach_device(struct addon_board_info
> *info,
> > +                                             struct
> greybus_descriptor_device *dev_desc)
> > +{
> > +     struct board_device_info *dev;
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
> > +     list_for_each_entry_safe(desc, next, &info->manifest_descs, links=
)
> {
> > +             if (desc->type !=3D GREYBUS_TYPE_DEVICE)
> > +                     continue;
> > +             desc_device =3D desc->data;
> > +             mikrobus_manifest_attach_device(info, desc_device);
> > +             devcount++;
> > +     }
> > +     return devcount;
> > +}
> > +
> > +bool mikrobus_manifest_parse(struct addon_board_info *info, void *data=
,
> > +                                                      size_t size)
> > +{
> > +     struct greybus_manifest *manifest;
> > +     struct greybus_manifest_header *header;
> > +     struct greybus_descriptor *desc;
> > +     u16 manifest_size;
> > +     int dev_count;
> > +     int desc_size;
> > +
> > +     if (WARN_ON(!list_empty(&info->manifest_descs)))
> > +             return false;
> > +     if (size < sizeof(*header))
> > +             return false;
> > +     manifest =3D data;
> > +     header =3D &manifest->header;
> > +     manifest_size =3D le16_to_cpu(header->size);
> > +     if (manifest_size !=3D size)
> > +             return false;
> > +     if (header->version_major > MIKROBUS_VERSION_MAJOR)
> > +             return false;
> > +     desc =3D manifest->descriptors;
> > +     size -=3D sizeof(*header);
> > +     while (size) {
> > +             desc_size =3D identify_descriptor(info, desc, size);
> > +             if (desc_size < 0) {
> > +                     pr_err("invalid manifest descriptor");
> > +             return -EINVAL;
> > +             }
> > +             desc =3D (struct greybus_descriptor *)((char *)desc +
> desc_size);
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

--000000000000d5ec1605ab5b77cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 26, 2020 at 8:48 AM Alex Elder &lt;<a href=3D"m=
ailto:elder@linaro.org">elder@linaro.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)">On 7/24/20 7:06 AM, Vaishnav M A wrote:<br>
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
Vaishnav, I am finally looking at this a little more closely<br>
today.=C2=A0 More than anything I want to compliment you on all<br>
this work.=C2=A0 I think it looks like a great use of Greybus for<br>
essentially its intended purpose, and I would love to see<br>
it extended as needed to support what you&#39;re doing here.<br>
<br>
At first glance your patch looks good, but I want to take the<br>
time to give it a thorough review.=C2=A0 Unfortunately I did not<br>
follow your progress on the GSoC project (which you posted<br>
about last year here), and have not followed any discussion<br>
since then, so it&#39;s taking me a little time to come up to speed<br>
on it.=C2=A0 I&#39;m hoping you might help me (and others) do this more<br>
quickly.<br>
<br>
I am scanning through some of the materials online and I find<br>
there is quite a lot.=C2=A0 That includes information about both<br>
your project and about mikroBUS.=C2=A0 Zeroing in on things that<br>
fairly concisely describe the way things really work would be<br>
very valuable.=C2=A0 Can you point me directly at something that<br>
gives an overview of both the hardware and software<br>
architecture (specifically as it&#39;s used with Greybus)?=C2=A0 If<br>
not, I&#39;m open to finding other ways to get in synch.=C2=A0 I&#39;ll<br>
expand on this a little more below.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">The exact implementation isn=E2=80=99t so critical, but =
understanding that using Greybus to talk to devices implementing the mikroB=
US standard is. One instance of the project is visible on my personal githu=
b account, but some documentation updates and additional roadmap/branding i=
tems would be helpful. I don=E2=80=99t want it to show up on widely distrib=
uted blogs yet, so I=E2=80=99ll send anyone that contacts me directly the p=
ublicly visible URL. Please don=E2=80=99t make me take it private again by =
getting it on a popular blog before we can refine our message.=C2=A0</div><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
This isn&#39;t strictly necessary, but if I wanted to reproduce the<br>
hardware setup you use to validate this code, what hardware<br>
is required?=C2=A0 For example, is it possible to use a BeagleBone Black<br=
>
with a MikroBus Cape for testing, or must a PocktBeagle be used?<br>
Is there one or several MikroBus clickboards that would be the<br>
best for basic testing?</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">Just about any Linux board with a mikroBUS socket can be used to rep=
roduce the function, though a PocketBeagle plus TechLab cape is the primary=
 development vehicle. Initial Greybus transport integration will be done wi=
th a limited bandwidth 2.4GHz 802.15.4 transport using gb-netlink and gbrid=
ge. Hardware is an ATUSB and CC1352R Launchpad with Click 2 Boosterpack.=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
Can you provide a short summary of why the Greybus manifest<br>
format needed to be extended?=C2=A0 Can you summarize how a mikroBUS<br>
add-on board differs from an Ara module?=C2=A0 And what they have in<br>
common?<br>
<br>
This patch is an RFC, and you say that v3 of the mikroBUS spec<br>
is being developed.=C2=A0 Is your plan to have the &quot;real&quot; code (w=
hen<br>
you submit it) adhere to the newer version of the spec?=C2=A0 Are<br>
there specific things that you expect will be included in v3<br>
that will how the driver works (compared to this RFC)?<br>
<br>
Please realize I&#39;m asking these questions so I can be more<br>
effective in evaluating what you&#39;re doing here.=C2=A0 I&#39;d like to<b=
r>
provide feedback not just on the code, but on the design that<br>
underlies it, and for that I need to get better informed.=C2=A0 My<br>
hope is that you can help me find or gather that information<br>
as quickly as possible.<br>
<br>
And now I&#39;ll go give a quick initial review of the code...<br>
<br>
Thanks.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Alex<br=
>
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
&gt; <br>
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
&gt; +<br>
&gt; +<br>
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
&gt; +<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;add_port=
: incorrect config data received: %s\n&quot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_register_port_config((void *)buf);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0if (res &lt; 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;delete_p=
ort: cannot parse mikrobus port ID\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!idr_find(&amp;mikrobus_port_idr, id)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;attempti=
ng to delete unregistered port [%d]\n&quot;, id);<br>
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
&gt; +static int mikrobus_port_scan_eeprom(struct mikrobus_port *port)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char header[12];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct addon_board_info *board;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int manifest_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nvmem_device_read(port-&gt;eeprom, 0, 12, header)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0manifest_size =3D mikrobus_manifest_header_valida=
te(header, 12);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (manifest_size &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D kzalloc(manif=
est_size, GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvmem_device_read(por=
t-&gt;eeprom, 0, manifest_size, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0board =3D kzalloc(siz=
eof(*board), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!board)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;b=
oard-&gt;manifest_descs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;b=
oard-&gt;devices);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_m=
anifest_parse(board, (void *)buf, manifest_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;failed to parse manifest, size: %d&quot;, manifest_size=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_r=
egister_board(port, board);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;failed to register board: %s&quot;, board-&gt;name);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;inavlide=
 manifest port %d&quot;, port-&gt;id);<br>
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
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_del(&amp;dev-&gt;links);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(dev);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void release_board_devices(struct addon_board_info *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *next;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(dev, next, &amp;info-&gt=
;devices, links)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release_mikrobus_devi=
ce(dev);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mikrobus_register_device(struct mikrobus_port *port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct board=
_device_info *dev, char *board_name)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_board_info *i2c;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct spi_board_info *spi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpiod_lookup_table *lookup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char devname[40];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot; registering device : %s\n&quot;, d=
ev-&gt;drv_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;gpio_lookup !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lookup =3D dev-&gt;gp=
io_lookup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev-&gt;protocol =
=3D=3D MIKROBUS_PROTOCOL_SPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0snprintf(devname, sizeof(devname), &quot;%s.%u&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_name(&amp;port-&gt;spi_mstr-&gt;dev)=
, dev-&gt;reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0lookup-&gt;dev_id =3D kmemdup(devname, 40, GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (dev-&gt;pr=
otocol =3D=3D MIKROBUS_PROTOCOL_I2C)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0lookup-&gt;dev_id =3D dev-&gt;drv_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot; adding=
 lookup table : %s\n&quot;, lookup-&gt;dev_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; =
dev-&gt;num_gpio_resources; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0lookup-&gt;table[i].key =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mikrobus_get_gpio_chip_name(port, lookup-&gt;table[i].chip_hwnum);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0lookup-&gt;table[i].chip_hwnum =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mikrobus_get_gpio_hwnum(port, lookup-&gt;table[i].chip_hwnum);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0lookup-&gt;table[i].flags =3D GPIO_ACTIVE_HIGH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_add_lookup_tabl=
e(lookup);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (dev-&gt;protocol) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROTOCOL_SPI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi =3D kzalloc(sizeof(*spi), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!spi)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0strncpy(spi-&gt;modalias, dev-&gt;drv_name, sizeo=
f(spi-&gt;modalias) - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-&gt;irq =3D mikro=
bus_get_irq(port, dev-&gt;irq, dev-&gt;irq_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;properties)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-&gt;properties =
=3D dev-&gt;properties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi-&gt;chip_select =3D dev-&gt;reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi-&gt;max_speed_hz =3D dev-&gt;max_speed_hz;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0spi-&gt;mode =3D dev-&gt;mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_spi_device_delete(port-&gt;spi_mstr, dev=
-&gt;reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;dev_client =3D (void *)spi_new_device(por=
t-&gt;spi_mstr, spi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROTOCOL_I2C:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c =3D kzalloc(sizeof(*i2c), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!i2c)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0strncpy(i2c-&gt;type, dev-&gt;drv_name, sizeof(i2=
c-&gt;type) - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c-&gt;irq =3D mikro=
bus_get_irq(port, dev-&gt;irq, dev-&gt;irq_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;properties)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c-&gt;properties =
=3D dev-&gt;properties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c-&gt;addr =3D dev-&gt;reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;dev_client =3D (void *)i2c_new_client_dev=
ice(port-&gt;i2c_adap, i2c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROTOCOL_UART:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot;SERDEV devices support not yet adde=
d&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void mikrobus_unregister_device(struct mikrobus_port *port, st=
ruct board_device_info *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *board_name)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot; removing device : %s\n&quot;, dev-=
&gt;drv_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;gpio_lookup !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_remove_lookup_t=
able(dev-&gt;gpio_lookup);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;gpio_lo=
okup);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dev-&gt;properties !=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dev-&gt;propert=
ies);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (dev-&gt;protocol) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROTOCOL_SPI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spi_unregister_device((struct spi_device *)dev-&g=
t;dev_client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROTOCOL_I2C:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c_unregister_device((struct i2c_client *)dev-&g=
t;dev_client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROTOCOL_UART:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_err(&quot;SERDEV devices support not yet added=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +int mikrobus_register_board(struct mikrobus_port *port,=C2=A0 =C2=A0 =
=C2=A0 struct addon_board_info *board)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *devinfo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(list_empty(&amp;board-&gt;devices)))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_setup_gpio(port-&gt;pwm_gpio,=
 board-&gt;pwm_gpio_state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;mikrobus=
_setup_gpio : can&#39;t setup pwm gpio state: (%d)\n&quot;, retval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_setup_gpio(port-&gt;int_gpio,=
 board-&gt;int_gpio_state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;mikrobus=
_setup_gpio : can&#39;t setup int gpio state: (%d)\n&quot;, retval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_setup_gpio(port-&gt;rst_gpio,=
 board-&gt;rst_gpio_state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;mikrobus=
_setup_gpio : can&#39;t setup rst gpio state: (%d)\n&quot;, retval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(devinfo, next, &amp;boar=
d-&gt;devices, links)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mikrobus_register_dev=
ice(port, devinfo, board-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;board =3D board;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_register_board);<br>
&gt; +<br>
&gt; +void mikrobus_unregister_board(struct mikrobus_port *port, struct add=
on_board_info *board)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *devinfo;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *next;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(list_empty(&amp;board-&gt;devices)))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;board =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(devinfo, next, &amp;boar=
d-&gt;devices, links)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mikrobus_unregister_d=
evice(port, devinfo, board-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0release_board_devices(board);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(board);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;board =3D NULL;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_unregister_board);<br>
&gt; +<br>
&gt; +int mikrobus_register_port_config(struct mikrobus_port_config *cfg)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port *port;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!is_registered))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EAGAIN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port =3D kzalloc(sizeof(*port), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!port)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;pwm_gpio =3D gpio_to_desc(cfg-&gt;pwm_gp=
io_nr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;int_gpio =3D gpio_to_desc(cfg-&gt;int_gp=
io_nr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;rst_gpio =3D gpio_to_desc(cfg-&gt;rst_gp=
io_nr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;spi_mstr =3D spi_busnum_to_master(cfg-&g=
t;spi_master_nr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;i2c_adap =3D i2c_get_adapter(cfg-&gt;i2c=
_adap_nr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_register_port(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;port : c=
an&#39;t register port from config (%d)\n&quot;, retval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_register_port_config);<br>
&gt; +<br>
&gt; +static struct i2c_board_info mikrobus_eeprom_info =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0I2C_BOARD_INFO(&quot;24c32&quot;, ATMEL_24C32_I2C=
_ADDR),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int mikrobus_port_probe_eeprom(struct mikrobus_port *port)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *eeprom_client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct nvmem_device *eeprom;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char dev_name[40];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0eeprom_client =3D i2c_new_client_device(port-&gt;=
i2c_adap, &amp;mikrobus_eeprom_info);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!IS_ERR(eeprom_client)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot; mikrob=
us port %d default eeprom is probed at %02x\n&quot;, port-&gt;id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0eeprom_client-&gt;addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(dev_name, si=
zeof(dev_name), &quot;%d-%04x0&quot;, port-&gt;i2c_adap-&gt;nr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eeprom_client-&gt;addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eeprom =3D nvmem_devi=
ce_get(&amp;eeprom_client-&gt;dev, dev_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(eeprom)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot; mikrobus port %d eeprom nvmem device probe failed\n&qu=
ot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0i2c_unregister_device(eeprom_client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0port-&gt;eeprom =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot; mikrob=
us port %d default eeprom probe failed\n&quot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;eeprom =3D eeprom;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;eeprom_client =3D eeprom_client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int mikrobus_register_port(struct mikrobus_port *port)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (WARN_ON(!is_registered))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EAGAIN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0id =3D idr_alloc(&amp;mikrobus_port_idr, port, 0,=
 0, GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (id &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;id =3D id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;dev.bus =3D &amp;mikrobus_bus_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;dev.type =3D &amp;mikrobus_port_type;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0strncpy(port-&gt;name, &quot;mikrobus-port&quot;,=
 sizeof(port-&gt;name) - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_set_name(&amp;port-&gt;dev, &quot;mikrobus-%d=
&quot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot;registering port mikrobus-%d\n &quo=
t;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D device_register(&amp;port-&gt;dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;port &#3=
9;%d&#39;: can&#39;t register device (%d)\n&quot;, port-&gt;id, retval);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_device(&amp;port-=
&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D class_compat_create_link(mikrobus_port=
_compat_class, &amp;port-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0po=
rt-&gt;dev.parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;port-&g=
t;dev, &quot;failed to create compatibility class link\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!port-&gt;eeprom) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;mikrobu=
s port %d eeprom empty probing default eeprom\n&quot;, port-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_p=
ort_probe_eeprom(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (port-&gt;eeprom) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D mikrobus_p=
ort_scan_eeprom(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retval)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(&amp;port-&gt;dev, &quot;failed to register board from mani=
fest\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_register_port);<br>
&gt; +<br>
&gt; +void mikrobus_del_port(struct mikrobus_port *port)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mikrobus_port *found;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0found =3D idr_find(&amp;mikrobus_port_idr, port-&=
gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (found !=3D port) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;attempti=
ng to delete unregistered port [%s]\n&quot;, port-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (port-&gt;board !=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;attempti=
ng to delete port with registered boards, port [%s]\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0port-&gt;name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (port-&gt;eeprom) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvmem_device_put(port=
-&gt;eeprom);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_unregister_device=
(port-&gt;eeprom_client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0class_compat_remove_link(mikrobus_port_compat_cla=
ss, &amp;port-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port-&gt;dev.parent);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0device_unregister(&amp;port-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0idr_remove(&amp;mikrobus_port_idr, port-&gt;id);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(&amp;port-&gt;dev, 0, sizeof(port-&gt;dev)=
);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(mikrobus_del_port);<br>
&gt; +<br>
&gt; +static int __init mikrobus_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0retval =3D bus_register(&amp;mikrobus_bus_type);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (retval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;bus_regi=
ster failed (%d)\n&quot;, retval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mikrobus_port_compat_class =3D class_compat_regis=
ter(&quot;mikrobus-port&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!mikrobus_port_compat_class) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;class_co=
mpat register failed (%d)\n&quot;, retval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retval =3D -ENOMEM;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto class_err;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0is_registered =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +class_err:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bus_unregister(&amp;mikrobus_bus_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0idr_destroy(&amp;mikrobus_port_idr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0is_registered =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return retval;<br>
&gt; +}<br>
&gt; +subsys_initcall(mikrobus_init);<br>
&gt; +<br>
&gt; +static void __exit mikrobus_exit(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bus_unregister(&amp;mikrobus_bus_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0class_compat_unregister(mikrobus_port_compat_clas=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0idr_destroy(&amp;mikrobus_port_idr);<br>
&gt; +}<br>
&gt; +module_exit(mikrobus_exit);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Vaishnav M A &lt;<a href=3D"mailto:vaishnav@beagl=
eboard.org" target=3D"_blank">vaishnav@beagleboard.org</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;mikroBUS main module&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; diff --git a/drivers/misc/mikrobus/mikrobus_core.h b/drivers/misc/mikr=
obus/mikrobus_core.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..9684d315f564<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/mikrobus/mikrobus_core.h<br>
&gt; @@ -0,0 +1,130 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * mikroBUS Driver for instantiating add-on<br>
&gt; + * board devices with an identifier EEPROM<br>
&gt; + *<br>
&gt; + * Copyright 2020 Vaishnav M A, BeagleBoard.org Foundation.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __MIKROBUS_H<br>
&gt; +#define __MIKROBUS_H<br>
&gt; +<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/errno.h&gt;<br>
&gt; +#include &lt;linux/i2c.h&gt;<br>
&gt; +#include &lt;linux/gpio.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +#include &lt;linux/gpio/machine.h&gt;<br>
&gt; +#include &lt;linux/spi/spi.h&gt;<br>
&gt; +#include &lt;linux/idr.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/jump_label.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/serdev.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/property.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +<br>
&gt; +#define MIKROBUS_VERSION_MAJOR 0x00<br>
&gt; +#define MIKROBUS_VERSION_MINOR 0x02<br>
&gt; +<br>
&gt; +extern struct bus_type mikrobus_bus_type;<br>
&gt; +extern struct device_type mikrobus_port_type;<br>
&gt; +<br>
&gt; +enum mikrobus_property_type {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_LINK =3D 0x00,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_GPIO =3D 0x01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_U8 =3D 0x02,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_U16 =3D 0x03,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_U32 =3D 0x04,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROPERTY_TYPE_U64 =3D 0x05,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum mikrobus_gpio_pin {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_INVALID =3D 0x00,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_INT =3D 0x01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_RST =3D 0x02,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_PWM =3D 0x03,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum mikrobus_protocol {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROTOCOL_SPI =3D 0x01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROTOCOL_I2C =3D 0x02,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROTOCOL_UART =3D 0x03,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROTOCOL_SPI_GPIOCS =3D 0x04,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_PROTOCOL_I2C_MUX =3D 0x05<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum mikrobus_gpio_state {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_UNUSED =3D 0x00,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_INPUT =3D 0x01,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_OUTPUT_HIGH =3D 0x02,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0MIKROBUS_GPIO_OUTPUT_LOW =3D 0x03,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct mikrobus_port_config {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 i2c_adap_nr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 spi_master_nr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 serdev_ctlr_nr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 rst_gpio_nr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 pwm_gpio_nr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__u8 int_gpio_nr;<br>
&gt; +} __packed;<br>
&gt; +<br>
&gt; +struct board_device_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head links;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *drv_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short protocol;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 max_speed_hz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int cs_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short num_gpio_resources;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short num_properties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct property_entry *properties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpiod_lookup_table *gpio_lookup;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *dev_client;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct addon_board_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short num_devices;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short rst_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short pwm_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short int_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head manifest_descs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head devices;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct mikrobus_port {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char name[48];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct module *owner;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *pwm_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *int_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *rst_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct spi_master *spi_mstr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_adapter *i2c_adap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct addon_board_info *board;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *eeprom_client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct nvmem_device *eeprom;<br>
&gt; +};<br>
&gt; +#define to_mikrobus_port(d) container_of(d, struct mikrobus_port, dev=
)<br>
&gt; +<br>
&gt; +int mikrobus_register_board(struct mikrobus_port *port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct addon_board_info *board=
);<br>
&gt; +void mikrobus_unregister_board(struct mikrobus_port *port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct addon_board_inf=
o *board);<br>
&gt; +int mikrobus_register_port_config(struct mikrobus_port_config *cfg);<=
br>
&gt; +int mikrobus_register_port(struct mikrobus_port *port);<br>
&gt; +void mikrobus_del_port(struct mikrobus_port *port);<br>
&gt; +<br>
&gt; +#endif /* __MIKROBUS_H */<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size =3D sizeof(*desc_header);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (desc_header-&gt;type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case GREYBUS_TYPE_STRING:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D sizeof(struct greybus_descript=
or_string);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size +=3D desc-&gt;string.length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0expected_size =3D ALIGN(expected_size, 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
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
&gt; +<br>
&gt; +static char *mikrobus_string_get(struct addon_board_info *info, u8 st=
ring_id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_string *desc_string;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool found =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *string;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!string_id)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry(descriptor, &amp;info-&gt;man=
ifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (descriptor-&gt;ty=
pe !=3D GREYBUS_TYPE_STRING)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc_string =3D descr=
iptor-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_string-&gt;i=
d =3D=3D string_id) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0found =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!found)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOEN=
T);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string =3D kmemdup(&amp;desc_string-&gt;string, d=
esc_string-&gt;length + 1, GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!string)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string[desc_string-&gt;length] =3D &#39;\0&#39;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0return string;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void mikrobus_state_get(struct addon_board_info *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_mikrobus *mikrobus;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_interface *interface;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool found =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry(descriptor, &amp;info-&gt;man=
ifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (descriptor-&gt;ty=
pe =3D=3D GREYBUS_TYPE_MIKROBUS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mikrobus =3D descriptor-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0found =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (found) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;num_devices =
=3D mikrobus-&gt;num_devices;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rst_gpio_sta=
te =3D mikrobus-&gt;rst_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;pwm_gpio_sta=
te =3D mikrobus-&gt;pwm_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;int_gpio_sta=
te =3D mikrobus-&gt;int_gpio_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;num_devices =
=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rst_gpio_sta=
te =3D MIKROBUS_GPIO_UNUSED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;pwm_gpio_sta=
te =3D MIKROBUS_GPIO_UNUSED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;int_gpio_sta=
te =3D MIKROBUS_GPIO_UNUSED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry(descriptor, &amp;info-&gt;man=
ifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (descriptor-&gt;ty=
pe =3D=3D GREYBUS_TYPE_INTERFACE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0interface =3D descriptor-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;name =3D mikrobus_string_get(info, inter=
face-&gt;product_stringid);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct property_entry *<br>
&gt; +mikrobus_property_entry_get(struct addon_board_info *info, u8 *prop_l=
ink,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int num_properties)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_property *desc_property=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct property_entry *properties;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char *prop_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool found =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 *val_u8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 *val_u16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 *val_u32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u64 *val_u64;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0properties =3D kcalloc(num_properties, sizeof(*pr=
operties), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!properties)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; num_properties; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(d=
escriptor, &amp;info-&gt;manifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (descriptor-&gt;type !=3D GREYBUS_TYPE_PROPERTY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0desc_property =3D descriptor-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (desc_property-&gt;id =3D=3D prop_link[i]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!found)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-ENOENT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop_name =3D mikrobu=
s_string_get(info, desc_property-&gt;propname_stringid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (desc_property=
-&gt;type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROPERT=
Y_TYPE_U8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_u8 =3D kmemdup(&a=
mp;desc_property-&gt;value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(desc_property-&gt;length) * sizeof(u8),=
 GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_property-&gt=
;length =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U8(prop_name, *val_u8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U8_ARRAY_LEN(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop_name, (void *)desc_property-&gt;val=
ue, desc_property-&gt;length);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROPERT=
Y_TYPE_U16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_u16 =3D kmemdup(&=
amp;desc_property-&gt;value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(desc_proper=
ty-&gt;length) * sizeof(u16), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_property-&gt=
;length =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U16(prop_name, *val_u16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U16_ARRAY_LEN(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop_name, (void *)desc_property-&gt;val=
ue, desc_property-&gt;length);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROPERT=
Y_TYPE_U32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_u32 =3D kmemdup(&=
amp;desc_property-&gt;value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(desc_proper=
ty-&gt;length) * sizeof(u32), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_property-&gt=
;length =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U32(prop_name, *val_u32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U32_ARRAY_LEN(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0prop_name, (void *)desc_property-&gt;value, desc_property-&gt;length=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MIKROBUS_PROPERT=
Y_TYPE_U64:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val_u64 =3D kmemdup(&=
amp;desc_property-&gt;value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(desc_property-&gt;length) * sizeof(u64), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_property-&gt=
;length =3D=3D 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U64(prop_name, *val_u64);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0properties[i] =3D PROPERTY_ENTRY_U64_ARRAY_LEN(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prop_name, (void *)desc_property-&gt;val=
ue, desc_property-&gt;length);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVA=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return properties;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u8 *mikrobus_property_link_get(struct addon_board_info *info, =
u8 prop_id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 prop_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor_property *desc_property=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct manifest_desc *descriptor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool found =3D false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 *val_u8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!prop_id)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry(descriptor, &amp;info-&gt;man=
ifest_descs, links) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (descriptor-&gt;ty=
pe !=3D GREYBUS_TYPE_PROPERTY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc_property =3D des=
criptor-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_property-&gt=
;id =3D=3D prop_id &amp;&amp; desc_property-&gt;type =3D=3D prop_type) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0found =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!found)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOEN=
T);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val_u8 =3D kmemdup(&amp;desc_property-&gt;value, =
desc_property-&gt;length, GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return val_u8;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mikrobus_manifest_attach_device(struct addon_board_info *i=
nfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0struct greybus_descriptor_device *dev_desc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct board_device_info *dev;<br>
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
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_manifest *manifest;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_manifest_header *header;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct greybus_descriptor *desc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 manifest_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int dev_count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int desc_size;<br>
&gt; +<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0if (header-&gt;version_major &gt; MIKROBUS_VERSIO=
N_MAJOR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0desc =3D manifest-&gt;descriptors;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size -=3D sizeof(*header);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc_size =3D identif=
y_descriptor(info, desc, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (desc_size &lt; 0)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;invalid manifest descriptor&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0desc =3D (struct grey=
bus_descriptor *)((char *)desc + desc_size);<br>
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

--000000000000d5ec1605ab5b77cc--

--===============6656361849329247820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

--===============6656361849329247820==--
