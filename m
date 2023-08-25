Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A57885DF
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Aug 2023 13:38:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CC7144004
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Aug 2023 11:38:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 4CD373F1AA
	for <greybus-dev@lists.linaro.org>; Fri, 25 Aug 2023 11:38:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=WGz81zNV;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6FBC64E57;
	Fri, 25 Aug 2023 11:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C7DC433C7;
	Fri, 25 Aug 2023 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692963488;
	bh=XGOkicQX+3TxVdYaiBBFYdrvG8YbE9kT9bFUawGN56k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGz81zNVxcfohq+BMIVGtCUL+aaZrtFo40vn6cUO9r/zNZKtMe/yngSv9q5Q14iK+
	 ouf5pXSQqydUBTzGyvA9c2bRuMZKcfYFl+oXz2+tck9LGuTLB/LsStD3K6xql2xMf/
	 H1WOt4+bUuymBSriXn5+qhZfje4R7SH9t3HeGhK8=
Date: Fri, 25 Aug 2023 13:38:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023082506-flying-trapped-df40@gregkh>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-3-ayushdevel1325@gmail.com>
 <2023082317-vagabond-lent-95ea@gregkh>
 <ba825082-6286-2571-6232-52353dfdae05@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba825082-6286-2571-6232-52353dfdae05@gmail.com>
X-Rspamd-Queue-Id: 4CD373F1AA
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
Message-ID-Hash: EZC3PUF4342EYTETE4FRUNAZV76KYTHB
X-Message-ID-Hash: EZC3PUF4342EYTETE4FRUNAZV76KYTHB
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] Add beagleplay greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EZC3PUF4342EYTETE4FRUNAZV76KYTHB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 04:53:01PM +0530, Ayush Singh wrote:
>=20
> On 8/23/23 23:06, Greg KH wrote:
> > > +#define BEAGLEPLAY_GB_MAX_CPORTS 32
> > Where does this number come from?
>=20
> Well, it is the max number of Cports our APBridge supports. Since it is a
> KConfig variable on Zephyr application side, maybe it should be a config
> variable here as well?

Just document it please.  But if this gets out of sync with the device
(as Linux has no idea what the device has), perhaps you should be able
to detect it automatically?

> > > +	if (hdr->result) {
> > > +		dev_warn(
> > > +			&bg->serdev->dev,
> > > +			"Failed Greybus Operation %u of Type %X on CPort %u with Status %=
u",
> > > +			hdr->operation_id, hdr->type, cport_id, hdr->result);
> > > +	} else {
> > > +		dev_dbg(&bg->serdev->dev,
> > > +			"Successful Greybus Operation %u of Type %X on CPort %u",
> > > +			hdr->operation_id, hdr->type, cport_id);
> > > +	}
> > > +	greybus_data_rcvd(bg->gb_host_device, cport_id, buffer, buffer_len);
> > > +}
> > > +
> > > +static void beagleplay_greybus_handle_dbg_frame(struct beagleplay_gr=
eybus *bg,
> > > +						const char *buffer,
> > > +						size_t buffer_len)
> > > +{
> > > +	char buf[RX_HDLC_PAYLOAD];
> > Are you sure you can do all of that on the stack?
>=20
> I think it should be fine. Zephyr application itself places a limit on the
> maximum size of an HDLC frame and compile time, and we will only process a
> single frame in this function. I do need to clean up some of these
> constants. And the zephyr application only supports a max frame of 256
> bytes, so the current buffer is way too big.

Again, plutting that much data on the stack is generally a bad idea.
Also, are you sure the hardware can copy from the stack properly?  Many
bus types can not handle this at all (i.e. USB), so can you just make it
dynamic?  Or is it needed at all?

> > > +	memcpy(buf, buffer, buffer_len);
> > > +	buf[buffer_len] =3D 0;
> > > +	dev_dbg(&bg->serdev->dev, "CC1352 Debug: %s", buf);
> > Why are you using a stack buffer for a debug log?
> >=20
> > And no need for prefixes on a debug message, that comes for free from
> > the dynamic debug infrastructure.
> >=20
> > and are you sure this buffer is a string?
>=20
> This is printing logs from BeaglePlay CC1352, which are transported over a
> specific HDLC address. This is because unless you have a JTAG, you cannot
> view anything happening in CC1352 without disabling the driver using dt
> overlay.=A0 This is incontinent for development and debugging.
>=20
> It should always be a string since I am routing the zephyr log outputs ov=
er
> hdlc: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware/-/blob/dev=
elop/src/hdlc_log_backend.c

Ok, but perhaps do something that doesn't need so much stack space just
for a debug message?

> > > +	}
> > > +
> > > +	beagleplay_greybus =3D dev_get_drvdata(&hd->dev);
> > > +	memcpy(message->header->pad, &cport_id, sizeof(u16));
> > > +	memcpy(&block_payload, message->header,
> > > +	       sizeof(struct gb_operation_msg_hdr));
> > > +	memcpy(&block_payload[sizeof(struct gb_operation_msg_hdr)],
> > > +	       message->payload, message->payload_size);
> > > +	hdlc_send_async(beagleplay_greybus->hdlc_drv, message->header->size,
> > > +			&block_payload, ADDRESS_GREYBUS, 0x03);
> > > +
> > > +	greybus_message_sent(beagleplay_greybus->gb_host_device, message, 0=
);
> > > +	return 0;
> > > +}
> > > +
> > > +static void gb_message_cancel(struct gb_message *message)
> > > +{
> > > +}
> > Why is an empty function needed?  That feels wrong.
>=20
> Well, this is a required function to define:
> https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/greybus/hd.c#L136

If it's required, an empty function is not allowed, right?  Otherwise
the core would allow an empty function :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
