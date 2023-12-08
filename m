Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D29809BB7
	for <lists+greybus-dev@lfdr.de>; Fri,  8 Dec 2023 06:33:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 79DAF4476D
	for <lists+greybus-dev@lfdr.de>; Fri,  8 Dec 2023 05:33:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 2E91E3EF7C
	for <greybus-dev@lists.linaro.org>; Fri,  8 Dec 2023 05:33:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=yMI5A72U;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CA3F62282;
	Fri,  8 Dec 2023 05:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3BFC433C7;
	Fri,  8 Dec 2023 05:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702013595;
	bh=c95vgIGojNc1fgzK6+ldl6rVKTigeKUbZUIuUxNNRPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yMI5A72U3NgOG4NNCRLUTGvUct5N4T6H+MPoYf9m/FzzWFuZiJIza5lEZTCatJdg4
	 EXTG1GtKEXSYfnuBmS3ynPe3VqMpsyrJyfhmE59ksqC92QP4FyKPPZomvzuVr3UVqQ
	 b3Dd1gz7h2kxufzLDmSpQX/iU2quknyme+8D+xC4=
Date: Fri, 8 Dec 2023 06:33:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023120805-endocrine-conflict-b1ff@gregkh>
References: <20231206150602.176574-1-ayushdevel1325@gmail.com>
 <20231206150602.176574-2-ayushdevel1325@gmail.com>
 <2023120758-coleslaw-unstopped-530c@gregkh>
 <c0823649-8235-40d7-813e-8a4500251219@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0823649-8235-40d7-813e-8a4500251219@gmail.com>
X-Rspamd-Queue-Id: 2E91E3EF7C
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: Q4YGJ2DZEF3G2PVWHIKPYDHJNDHNBP4B
X-Message-ID-Hash: Q4YGJ2DZEF3G2PVWHIKPYDHJNDHNBP4B
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q4YGJ2DZEF3G2PVWHIKPYDHJNDHNBP4B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 07, 2023 at 10:33:54PM +0530, Ayush Singh wrote:
> > > + *
> > > + * @cport: cport id
> > > + * @hdr: greybus operation header
> > > + * @payload: greybus message payload
> > > + */
> > > +struct hdlc_greybus_frame {
> > > +	__le16 cport;
> > > +	struct gb_operation_msg_hdr hdr;
> > > +	u8 payload[];
> > > +} __packed;
> > > +
> > >   static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
> > >   {
> > > -	u16 cport_id;
> > > -	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
> > > +	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
> > > +	u16 cport_id = le16_to_cpu(gb_frame->cport);
> > > -	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
> > > +	/* Ensure that the greybus message is valid */
> > > +	if (le16_to_cpu(gb_frame->hdr.size) > len - sizeof(cport_id)) {
> > > +		dev_warn_ratelimited(&bg->sd->dev, "Invalid/Incomplete greybus message");
> > Don't spam the kernel log for corrupted data on the line, that would be
> > a mess.  Use a tracepoint?
> > 
> > > +		return;
> > > +	}
> > >   	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
> > > -		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
> > > +		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
> > Better yet, put the error in the debug message?
> Shouldn't corrupt data be a warning rather than debug message, since it
> indicates something wrong with the transport?

Do you want messages like that spamming the kernel log all the time if a
network connection is corrupted?

Just handle the error and let the upper layers deal with it when the
problem is eventually reported to userspace, that's all that is needed.


> > > -	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
> > > +	greybus_data_rcvd(bg->gb_hd, cport_id, &buf[sizeof(cport_id)],
> > Fun with pointer math.  This feels really fragile, why not just point to
> > the field instead?
> It seems that taking address of members of packed structures is not valid.

That feels really odd.

> I get the `address-of-packed-member` warnings. Is it fine to ignore
> those in kernel?

What error exactly are you getting?  Packed or not does not mean
anything to the address of a member.  If it does, perhaps you are doing
something wrong as you are really doing the same thing here, right?
Don't ignore the warning by open-coding it.

> > >   }
> > >   static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
> > > @@ -339,7 +357,7 @@ static struct serdev_device_ops gb_beagleplay_ops = {
> > >   static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
> > >   {
> > >   	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
> > > -	struct hdlc_payload payloads[2];
> > > +	struct hdlc_payload payloads[3];
> > why 3?
> > 
> > It's ok to put this on the stack?
> 
> Well, the HDLC payload is just to store the length of the payload along with
> a pointer to its data. (kind of emulate a fat pointer). The reason for doing
> it this way is to avoid having to create a temp buffer for each message when
> sending data over UART (which was done in the initial version of the
> driver).

Be careful, are you SURE you are allowed to send stack-allocated data?
I know that many busses forbid this (like USB).  So please check to be
sure that this is ok to do, and that these are not huge structures that
you are putting on the very-limited kernel-stack.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
