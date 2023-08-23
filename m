Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 35476785E8D
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 19:29:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3F13E40F64
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 17:29:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id BF2143EC47
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 17:29:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=FAXylhUW;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59AF762AA9;
	Wed, 23 Aug 2023 17:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C24C433C8;
	Wed, 23 Aug 2023 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692811745;
	bh=DxcClGKkNufjpCe6gbxIVXqDxKNDQaHPhD/YzzhrwDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FAXylhUWJPRV1t2SGPJZqg5CGJnww3CnYPDgUkJxyHI7k3nOKLGgdUVohWW//4qi1
	 p/gK8S5PhnJmPbez8rN5Fh6SoP708wNF7Q4Rq10wiUyna+Pgjvx2CfxdzdQqgLfj6d
	 Wac2NSJx9OA3klGaz79AH5mAnbiHraiw/YXWlXbs=
Date: Wed, 23 Aug 2023 19:29:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023082307-untapped-automatic-ec5f@gregkh>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-4-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823165520.181301-4-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: BF2143EC47
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com,kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 4OUQR7VE6QHSHNBTNJPFDBDYQIQC2BCV
X-Message-ID-Hash: 4OUQR7VE6QHSHNBTNJPFDBDYQIQC2BCV
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/4] Add HDLC helper for beagleplay driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4OUQR7VE6QHSHNBTNJPFDBDYQIQC2BCV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 23, 2023 at 10:25:19PM +0530, Ayush Singh wrote:
> This file provides functions that allow sending and recieving async HDLC
> frames over any transport. Currently only tested with UART.
> 
> I am not quite sure where these files should go so I have put them close
> to Beagleplay greybus driver for now.

This shouldn't be in a changelog text :)

You can put comments below the --- line.

And to answer this question, no, it probably shouldn't be here in
drivers/staging/ it should be in the "real" part of the kernel as it is
a real driver.  drivers/staging/ is for stuff that still needs work to
do to get it out of that part of the kernel, do the work ahead of time
and then you don't have to mess with that at all.

> 
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  drivers/staging/greybus/hdlc.c | 229 +++++++++++++++++++++++++++++++++
>  drivers/staging/greybus/hdlc.h | 137 ++++++++++++++++++++

No need for a .h file for a simple .c file, just put it all together
into one file please.

>  2 files changed, 366 insertions(+)
>  create mode 100644 drivers/staging/greybus/hdlc.c
>  create mode 100644 drivers/staging/greybus/hdlc.h
> 
> diff --git a/drivers/staging/greybus/hdlc.c b/drivers/staging/greybus/hdlc.c
> new file mode 100644
> index 000000000000..079d4c10e476
> --- /dev/null
> +++ b/drivers/staging/greybus/hdlc.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
> + */
> +
> +#include "hdlc.h"
> +#include <linux/device.h>
> +#include <linux/crc-ccitt.h>
> +#include <linux/serdev.h>
> +
> +static void hdlc_write_locked(struct hdlc_driver *drv)
> +{
> +	// must be locked already

What must be locked?  I don't understand this comment, sorry.

> +	int head = smp_load_acquire(&drv->tx_circ_buf.head);
> +	int tail = drv->tx_circ_buf.tail;
> +	int count = CIRC_CNT_TO_END(head, tail, TX_CIRC_BUF_SIZE);
> +	int written;
> +
> +	if (count >= 1) {
> +		written = drv->hdlc_send_frame_cb(dev_get_drvdata(drv->parent),
> +						  &drv->tx_circ_buf.buf[tail],
> +						  count);
> +
> +		/* Finish consuming HDLC data */
> +		smp_store_release(&drv->tx_circ_buf.tail,
> +				  (tail + written) & (TX_CIRC_BUF_SIZE - 1));
> +	}
> +}
> +
> +static void hdlc_append(struct hdlc_driver *drv, u8 value)
> +{
> +	// must be locked already

Again, I don't understand.

> +	int head, tail;
> +
> +	head = drv->tx_circ_buf.head;
> +
> +	while (true) {
> +		tail = READ_ONCE(drv->tx_circ_buf.tail);
> +
> +		if (CIRC_SPACE(head, tail, TX_CIRC_BUF_SIZE) >= 1) {
> +			drv->tx_circ_buf.buf[head] = value;
> +
> +			/* Finish producing HDLC byte */
> +			smp_store_release(&drv->tx_circ_buf.head,
> +					  (head + 1) & (TX_CIRC_BUF_SIZE - 1));
> +			return;
> +		}
> +		dev_warn(drv->parent, "Tx circ buf full\n");
> +		usleep_range(3000, 5000);
> +	}
> +}
> +
> +static void hdlc_append_escaped(struct hdlc_driver *drv, u8 value)
> +{
> +	if (value == HDLC_FRAME || value == HDLC_ESC) {
> +		hdlc_append(drv, HDLC_ESC);
> +		value ^= HDLC_XOR;
> +	}
> +	hdlc_append(drv, value);
> +}
> +
> +static void hdlc_append_tx_frame(struct hdlc_driver *drv)
> +{
> +	drv->tx_crc = 0xFFFF;
> +	hdlc_append(drv, HDLC_FRAME);
> +}
> +
> +static void hdlc_append_tx_u8(struct hdlc_driver *drv, u8 value)
> +{
> +	drv->tx_crc = crc_ccitt(drv->tx_crc, &value, 1);
> +	hdlc_append_escaped(drv, value);
> +}
> +
> +static void hdlc_append_tx_buffer(struct hdlc_driver *drv, const void *buffer,
> +				  size_t len)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < len; i++)
> +		hdlc_append_tx_u8(drv, ((u8 *)buffer)[i]);
> +}
> +
> +static void hdlc_append_tx_crc(struct hdlc_driver *drv)
> +{
> +	drv->tx_crc ^= 0xffff;
> +	hdlc_append_escaped(drv, drv->tx_crc & 0xff);
> +	hdlc_append_escaped(drv, (drv->tx_crc >> 8) & 0xff);
> +}
> +
> +static void hdlc_handle_rx_frame(struct hdlc_driver *drv)
> +{
> +	u8 address = drv->rx_buffer[0];
> +	char *buf = &drv->rx_buffer[2];
> +	size_t buf_len = drv->rx_buffer_len - 4;
> +
> +	drv->hdlc_process_frame_cb(dev_get_drvdata(drv->parent), buf, buf_len,
> +				   address);
> +}
> +
> +static void hdlc_transmit(struct work_struct *work)
> +{
> +	struct hdlc_driver *drv =
> +		container_of(work, struct hdlc_driver, tx_work);
> +
> +	spin_lock_bh(&drv->tx_consumer_lock);
> +	hdlc_write_locked(drv);
> +	spin_unlock_bh(&drv->tx_consumer_lock);
> +}
> +
> +static void hdlc_send_s_frame_ack(struct hdlc_driver *drv)
> +{
> +	u8 address = drv->rx_buffer[0];
> +
> +	hdlc_send_async(drv, 0, NULL, address, (drv->rx_buffer[1] >> 1) & 0x7);
> +}
> +
> +int hdlc_rx(struct hdlc_driver *drv, const unsigned char *data, size_t count)

Why is this a global function?

> +void hdlc_send_async(struct hdlc_driver *drv, u16 length, const void *buffer,
> +		     u8 address, u8 control)
> +{

Same here, why is this global?

Who calls these new functions?  There seems to be something missing here
as if this is never called, there's no need for it?

confused,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
