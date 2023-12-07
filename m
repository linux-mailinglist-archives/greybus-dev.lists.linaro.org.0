Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593F8086C0
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Dec 2023 12:30:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3488343C8E
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Dec 2023 11:30:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id EECA43EEB4
	for <greybus-dev@lists.linaro.org>; Thu,  7 Dec 2023 11:30:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ZasI4foS;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 849146208E;
	Thu,  7 Dec 2023 11:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55ECC433C9;
	Thu,  7 Dec 2023 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701948632;
	bh=yW7tXWdDtIWMp7veY4GKrj377HGeMh3azpE291fF+DE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZasI4foS+lpsk6sVVze2+Fxi1d3UOk8JkVu4yEUNu7HZKZJ6ZI7/P9/8FxZZ01BfG
	 u6uPDMIRwOHssp6eiDTxRXH4GDyKQCQpAzenKZyoI8iZMgz+uAj75WPNlDZ55o1LEy
	 aA2K4GryPbPqpuWtCmR7qL52wgo8CMaDVwTf/g6w=
Date: Thu, 7 Dec 2023 12:30:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023120758-coleslaw-unstopped-530c@gregkh>
References: <20231206150602.176574-1-ayushdevel1325@gmail.com>
 <20231206150602.176574-2-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231206150602.176574-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: EECA43EEB4
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
Message-ID-Hash: Z47NVPSLMTBKKICJPMRQAX2OKV7SCG4X
X-Message-ID-Hash: Z47NVPSLMTBKKICJPMRQAX2OKV7SCG4X
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z47NVPSLMTBKKICJPMRQAX2OKV7SCG4X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 06, 2023 at 08:36:00PM +0530, Ayush Singh wrote:
> Make gb-beagleplay greybus spec compliant by using a wrapper around HDLC
> payload to include cport information.

"wrapper"?  You just changed the data you send on your "wire", right?

> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
>  drivers/greybus/gb-beagleplay.c | 44 +++++++++++++++++++++++----------
>  1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 1e70ff7e3da4..fb40ade9364f 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -85,17 +85,35 @@ struct hdlc_payload {
>  	void *buf;
>  };
>  
> +/**
> + * struct hdlc_greybus_frame - Structure to represent greybus HDLC frame

Represent it where?  And where is this documented?

> + *
> + * @cport: cport id
> + * @hdr: greybus operation header
> + * @payload: greybus message payload
> + */
> +struct hdlc_greybus_frame {
> +	__le16 cport;
> +	struct gb_operation_msg_hdr hdr;
> +	u8 payload[];
> +} __packed;
> +
>  static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>  {
> -	u16 cport_id;
> -	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
> +	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
> +	u16 cport_id = le16_to_cpu(gb_frame->cport);
>  
> -	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
> +	/* Ensure that the greybus message is valid */
> +	if (le16_to_cpu(gb_frame->hdr.size) > len - sizeof(cport_id)) {
> +		dev_warn_ratelimited(&bg->sd->dev, "Invalid/Incomplete greybus message");

Don't spam the kernel log for corrupted data on the line, that would be
a mess.  Use a tracepoint?

> +		return;
> +	}
>  
>  	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
> -		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
> +		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);

Better yet, put the error in the debug message?

>  
> -	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
> +	greybus_data_rcvd(bg->gb_hd, cport_id, &buf[sizeof(cport_id)],

Fun with pointer math.  This feels really fragile, why not just point to
the field instead?

> +			  le16_to_cpu(gb_frame->hdr.size));

You convert the size twice, might as well do it once up above, right?

Also, it's best to use the same value you checked as the value you pass
in here, odds are you can't change the data underneath you (like you
could if this came from userspace), but it's best to not get in the
habit of coding like this.


>  }
>  
>  static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
> @@ -339,7 +357,7 @@ static struct serdev_device_ops gb_beagleplay_ops = {
>  static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
>  {
>  	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
> -	struct hdlc_payload payloads[2];
> +	struct hdlc_payload payloads[3];

why 3?

It's ok to put this on the stack?

>  	__le16 cport_id = le16_to_cpu(cport);
>  
>  	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
> @@ -348,14 +366,14 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
>  	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
>  		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
>  
> -	memcpy(msg->header->pad, &cport_id, sizeof(cport_id));
> -
> -	payloads[0].buf = msg->header;
> -	payloads[0].len = sizeof(*msg->header);
> -	payloads[1].buf = msg->payload;
> -	payloads[1].len = msg->payload_size;
> +	payloads[0].buf = &cport_id;
> +	payloads[0].len = sizeof(cport_id);
> +	payloads[1].buf = msg->header;
> +	payloads[1].len = sizeof(*msg->header);
> +	payloads[2].buf = msg->payload;
> +	payloads[2].len = msg->payload_size;

So you send the cport number as the first message?  Don't you need to
document this somewhere?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
