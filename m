Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75580361B
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Dec 2023 15:11:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 70C2B43C45
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Dec 2023 14:11:43 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 81B4D3F65C
	for <greybus-dev@lists.linaro.org>; Mon,  4 Dec 2023 14:11:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=qW9ttmgJ;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C11BFCE10B7;
	Mon,  4 Dec 2023 14:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60460C433C7;
	Mon,  4 Dec 2023 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701699092;
	bh=pZhSxzLDzMwLZSfKGfa6FYFeoHxIe+AuaBCdsEgSWVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qW9ttmgJAe2sgcaGpxz/Sox+kGWSziuO6ntnuQksxQfiD6B2ZimW1Rd0k2PDgfmaA
	 aqtLe6wElfihVrxd0buHMlcDAZXIOZjIOSF4u8FUlPTG2boYnjV3OzCkRu2Lsyv4oZ
	 6C70WhJBgwiVfcGoVEGZ2qSC3k5UV/P03pBKdmROoS4pJlKh+7EO9hPwZWe9iuFizq
	 xcDh2hhhu7HUtUJqq1EW4+rt6RwGSyttvMewlFs4l/ZkAt1JS1VxU8k9QuQevrHCM9
	 qLcom1jzpiFwUeTUuKx+63WL79fCUTkfQ+SJYxmRH6k2PKcHe+60Zhrx9N5+k0EThg
	 Vb+sIYAO5NqgQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rA9gE-0003ez-07;
	Mon, 04 Dec 2023 15:12:14 +0100
Date: Mon, 4 Dec 2023 15:12:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204131008.384583-1-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 81B4D3F65C
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: CYC6LOPZYMMNIXKJ5XF3DYJQBRQCFE7H
X-Message-ID-Hash: CYC6LOPZYMMNIXKJ5XF3DYJQBRQCFE7H
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CYC6LOPZYMMNIXKJ5XF3DYJQBRQCFE7H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 04, 2023 at 06:40:06PM +0530, Ayush Singh wrote:
> Ensure that the following values are little-endian:
> - header->pad (which is used for cport_id)
> - header->size
> 
> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
> ---
> V3:
> - Fix endiness while sending.
> V2: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC/
> - Ensure endianess for header->pad
> V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/
> 
>  drivers/greybus/gb-beagleplay.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 43318c1993ba..8b21c3e1e612 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -93,9 +93,9 @@ static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>  	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
>  
>  	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
> -		hdr->operation_id, hdr->type, cport_id, hdr->result);
> +		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
>  
> -	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
> +	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);

This looks broken; a quick against mainline (and linux-next) check shows
cport_id to be u16.

I think you want get_unaligned_le16() or something instead of that
memcpy() above.

But that just begs the question: why has this driver repurposed the pad
bytes like this? The header still says that these shall be set to zero.

>  }
>  
>  static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
> @@ -340,14 +340,15 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
>  {
>  	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
>  	struct hdlc_payload payloads[2];
> +	__le16 cport_id = cpu_to_le16(cport);
>  
>  	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
>  		msg->header->operation_id, msg->header->type, cport);
>  
> -	if (msg->header->size > RX_HDLC_PAYLOAD)
> +	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
>  		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
>  
> -	memcpy(msg->header->pad, &cport, sizeof(cport));
> +	memcpy(msg->header->pad, &cport_id, sizeof(cport_id));

put_unaligned_le16(), if the driver should be messing with the pad
bytes like this at all...

>  
>  	payloads[0].buf = msg->header;
>  	payloads[0].len = sizeof(*msg->header);

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
