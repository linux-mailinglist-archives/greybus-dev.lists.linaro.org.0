Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CB785EB6
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 19:36:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C268B40F64
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 17:36:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 3B80B3E9D4
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 17:36:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=DG50Nf4u;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C031762072;
	Wed, 23 Aug 2023 17:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A60C433C7;
	Wed, 23 Aug 2023 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692812165;
	bh=fPJjHEwHbLOFY4h2ocPzHpcsjZgmBXwAcomI6tx0EL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DG50Nf4uiZSWSMYfALwSYY44R/B4mM6Tm6ShrhOIhuz0mw4U2AXO3rGnm2zvrciyT
	 ErcWxQ82jmoOPkBoGCdA5fEmQJxNus1idCzBYLrDCqH36Vlgz9OKW89e44GZ80gi8c
	 M2860njcg3z5x7VyqStl16YSxQlQMU6lY+IWpac0=
Date: Wed, 23 Aug 2023 19:36:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023082317-vagabond-lent-95ea@gregkh>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-3-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823165520.181301-3-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 3B80B3E9D4
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
Message-ID-Hash: TJBQCDS6OQ23LZA4XZ6FIREKOWSD3JHW
X-Message-ID-Hash: TJBQCDS6OQ23LZA4XZ6FIREKOWSD3JHW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] Add beagleplay greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TJBQCDS6OQ23LZA4XZ6FIREKOWSD3JHW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 23, 2023 at 10:25:18PM +0530, Ayush Singh wrote:
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>

I can't take patches without any changelog text at all (neither do you
want me to.)

Writing the changelog is usually the hardest part.  Take a look at the
link my patch bot sent you and read that to see what to do.

> ---
>  .../greybus/beagleplay-greybus-driver.c       | 264 ++++++++++++++++++

This is a really really really long name for a driver.

Why not beagle_gb.c?



>  .../greybus/beagleplay-greybus-driver.h       |  28 ++

Again, no need for .h files for a simple .c file.

> +#define BEAGLEPLAY_GREYBUS_DRV_VERSION "0.1.0"

driver versions make no sense in the kernel tree, just drop this.

> +#define BEAGLEPLAY_GREYBUS_DRV_NAME "bcfgreybus"

KBUILD_MODNAME?

> +#define BEAGLEPLAY_GB_MAX_CPORTS 32

Where does this number come from?

> +
> +static const struct of_device_id beagleplay_greybus_of_match[] = {
> +	{
> +		.compatible = "beagle,beagleplaygreybus",

Are you sure this will work?  You need to get your dt changes properly
reviewed first.

> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, beagleplay_greybus_of_match);
> +
> +static int beagleplay_greybus_serdev_write_locked(void *drvdata,
> +						  const unsigned char *buf,
> +						  size_t buf_len)
> +{
> +	struct beagleplay_greybus *beagleplay_greybus;
> +
> +	beagleplay_greybus = drvdata;
> +	return serdev_device_write_buf(beagleplay_greybus->serdev, buf,
> +				       buf_len);
> +}
> +
> +static void
> +beagleplay_greybus_handle_greybus_frame(struct beagleplay_greybus *bg,
> +					u8 *buffer, size_t buffer_len)
> +{
> +	u16 cport_id;
> +	struct gb_operation_msg_hdr *hdr =
> +		(struct gb_operation_msg_hdr *)buffer;
> +	memcpy(&cport_id, hdr->pad, sizeof(u16));


Did you run checkpatch on the code before sending it?  Please do so.


> +	if (hdr->result) {
> +		dev_warn(
> +			&bg->serdev->dev,
> +			"Failed Greybus Operation %u of Type %X on CPort %u with Status %u",
> +			hdr->operation_id, hdr->type, cport_id, hdr->result);
> +	} else {
> +		dev_dbg(&bg->serdev->dev,
> +			"Successful Greybus Operation %u of Type %X on CPort %u",
> +			hdr->operation_id, hdr->type, cport_id);
> +	}
> +	greybus_data_rcvd(bg->gb_host_device, cport_id, buffer, buffer_len);
> +}
> +
> +static void beagleplay_greybus_handle_dbg_frame(struct beagleplay_greybus *bg,
> +						const char *buffer,
> +						size_t buffer_len)
> +{
> +	char buf[RX_HDLC_PAYLOAD];

Are you sure you can do all of that on the stack?

> +
> +	memcpy(buf, buffer, buffer_len);
> +	buf[buffer_len] = 0;
> +	dev_dbg(&bg->serdev->dev, "CC1352 Debug: %s", buf);

Why are you using a stack buffer for a debug log?

And no need for prefixes on a debug message, that comes for free from
the dynamic debug infrastructure.

and are you sure this buffer is a string?

> +}
> +
> +static void beagleplay_greybus_handle_hdlc_rx_frame(void *drv_data, u8 *buffer,
> +						    size_t buffer_len,
> +						    uint8_t address)
> +{
> +	struct beagleplay_greybus *beagleplay_greybus;
> +
> +	beagleplay_greybus = drv_data;

This is usually just one line:
	struct beagleplay_greybus *beagleplay_greybus = drv_data;

but really, use less characters, how about:
	struct beagle_gb *beagle_gb = data;

or something like that.

> +
> +	switch (address) {
> +	case ADDRESS_DBG:
> +		beagleplay_greybus_handle_dbg_frame(beagleplay_greybus, buffer,
> +						    buffer_len);

very long function names, you can make them smaller :)


> +		break;
> +	case ADDRESS_GREYBUS:
> +		beagleplay_greybus_handle_greybus_frame(beagleplay_greybus,
> +							buffer, buffer_len);
> +		break;
> +	default:
> +		dev_warn(&beagleplay_greybus->serdev->dev,
> +			 "Got Unknown Frame %u", address);
> +	}
> +}
> +
> +static int beagleplay_greybus_tty_receive(struct serdev_device *serdev,
> +					  const unsigned char *data,
> +					  size_t count)
> +{
> +	struct beagleplay_greybus *beagleplay_greybus;
> +
> +	beagleplay_greybus = serdev_device_get_drvdata(serdev);
> +	return hdlc_rx(beagleplay_greybus->hdlc_drv, data, count);
> +}
> +
> +static void beagleplay_greybus_tty_wakeup(struct serdev_device *serdev)
> +{
> +	struct beagleplay_greybus *beagleplay_greybus;
> +
> +	beagleplay_greybus = serdev_device_get_drvdata(serdev);
> +	hdlc_tx_wakeup(beagleplay_greybus->hdlc_drv);
> +}
> +
> +static struct serdev_device_ops beagleplay_greybus_ops = {
> +	.receive_buf = beagleplay_greybus_tty_receive,
> +	.write_wakeup = beagleplay_greybus_tty_wakeup,
> +};
> +
> +static int gb_message_send(struct gb_host_device *hd, u16 cport_id,
> +			   struct gb_message *message, gfp_t gfp_mask)
> +{
> +	struct beagleplay_greybus *beagleplay_greybus;
> +	char block_payload[HDLC_MAX_BLOCK_SIZE];
> +
> +	dev_dbg(&hd->dev,
> +		"Sending Greybus message with Operation %u, Type: %X on Cport %u",
> +		message->header->operation_id, message->header->type, cport_id);
> +
> +	if (message->header->size > HDLC_MAX_BLOCK_SIZE) {
> +		dev_err(&hd->dev, "Greybus message too big");
> +		return -1;

Please always use real error values, not made up negative numbers.
-ETOBIG?

> +	}
> +
> +	beagleplay_greybus = dev_get_drvdata(&hd->dev);
> +	memcpy(message->header->pad, &cport_id, sizeof(u16));
> +	memcpy(&block_payload, message->header,
> +	       sizeof(struct gb_operation_msg_hdr));
> +	memcpy(&block_payload[sizeof(struct gb_operation_msg_hdr)],
> +	       message->payload, message->payload_size);
> +	hdlc_send_async(beagleplay_greybus->hdlc_drv, message->header->size,
> +			&block_payload, ADDRESS_GREYBUS, 0x03);
> +
> +	greybus_message_sent(beagleplay_greybus->gb_host_device, message, 0);
> +	return 0;
> +}
> +
> +static void gb_message_cancel(struct gb_message *message)
> +{
> +}

Why is an empty function needed?  That feels wrong.

> +
> +static struct gb_hd_driver gb_hdlc_driver = { .message_send = gb_message_send,
> +					      .message_cancel =
> +						      gb_message_cancel };

Formatting can be fixed up here.

> +
> +static void beagleplay_greybus_start_svc(struct beagleplay_greybus *bg)
> +{
> +	const u8 command[1] = { CONTROL_SVC_START };

Are you sure this is allowed on the stack?

> +
> +	hdlc_send_async(bg->hdlc_drv, sizeof(command), command, ADDRESS_CONTROL,
> +			0x03);
> +}
> +
> +static void beagleplay_greybus_stop_svc(struct beagleplay_greybus *bg)
> +{
> +	const u8 command = CONTROL_SVC_STOP;
> +
> +	hdlc_send_async(bg->hdlc_drv, 1, &command, ADDRESS_CONTROL, 0x03);
> +}
> +
> +static int beagleplay_greybus_probe(struct serdev_device *serdev)
> +{
> +	struct beagleplay_greybus *bg;
> +	u32 speed = 115200;
> +	int ret = 0;
> +
> +	bg = devm_kmalloc(&serdev->dev, sizeof(struct beagleplay_greybus),
> +			  GFP_KERNEL);
> +
> +	bg->serdev = serdev;
> +
> +	serdev_device_set_drvdata(serdev, bg);
> +	serdev_device_set_client_ops(serdev, &beagleplay_greybus_ops);
> +
> +	ret = serdev_device_open(serdev);
> +	if (ret) {
> +		dev_err(&bg->serdev->dev, "Unable to Open Device");
> +		return ret;
> +	}
> +
> +	speed = serdev_device_set_baudrate(serdev, speed);
> +	dev_info(&bg->serdev->dev, "Using baudrate %u\n", speed);
> +
> +	serdev_device_set_flow_control(serdev, false);
> +
> +	// Init HDLC
> +	bg->hdlc_drv =
> +		hdlc_init(&serdev->dev, beagleplay_greybus_serdev_write_locked,
> +			  beagleplay_greybus_handle_hdlc_rx_frame);
> +	if (!bg->hdlc_drv) {
> +		dev_err(&serdev->dev, "Failed to initialize HDLC");
> +		return -ENOMEM;
> +	}
> +
> +	// Greybus setup
> +	bg->gb_host_device =
> +		gb_hd_create(&gb_hdlc_driver, &serdev->dev, TX_CIRC_BUF_SIZE,
> +			     BEAGLEPLAY_GB_MAX_CPORTS);
> +	if (IS_ERR(bg->gb_host_device)) {
> +		dev_err(&bg->serdev->dev,
> +			"Unable to create Greybus Host Device");
> +		return -1;

How about returning the error given to you?


> +	}
> +	ret = gb_hd_add(bg->gb_host_device);
> +	if (ret) {
> +		dev_err(&serdev->dev, "Failed to add Greybus Host Device");
> +		return ret;

Did you just leak memory?


Anyway, these are all tiny things, it's great to see this work
happening, it's getting close!

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
