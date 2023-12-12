Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B836E80EE3B
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Dec 2023 15:01:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 757B843C71
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Dec 2023 14:01:16 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	by lists.linaro.org (Postfix) with ESMTPS id 4C09E3EA1B
	for <greybus-dev@lists.linaro.org>; Tue, 12 Dec 2023 14:01:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=V7ioMS4z;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.53 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7b72d574399so229635239f.0
        for <greybus-dev@lists.linaro.org>; Tue, 12 Dec 2023 06:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1702389670; x=1702994470; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50USpyDw1BzfC5HC+GbOK7tULHOIxS4MMTe1pZHKtgw=;
        b=V7ioMS4zT3FBnyvfoASb3BkQlvCN4vVXMqfQTrdk9pc3ON/A4RQTVd1rdEv/ZO91dw
         1ezlV+dherm2IzdWREqa3JDZVs0uQLcpDhzAJNVXKt8A7FIkV0bJ/G7aYeu7pA7aev8A
         rLEyGG/lJjeE6VK1UX6kAhqSUl6Rg7OBhiuO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389670; x=1702994470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50USpyDw1BzfC5HC+GbOK7tULHOIxS4MMTe1pZHKtgw=;
        b=a7N1MseFoPkSqC9c+LjG6CbyIyNy5ehb3Ljcf2r5H9UIqrjnYD1rLBiVng9WDfvzUt
         MIpw5lECS0qtWBA2M7TkEJqsR9f6NayE1vnhw3gSJx3dOcZ45t60tdXnmHdBWa035KkC
         Xd1UfFCMGzJ1+Rli8KOoIG7KCJ9KoUePldTGMldm5x6LACm0j/TdAHQ/yaIBN6l7jHev
         roi0VfnKDS5xC6CD5ZvmAYUt7+XqnZArs2nFm0C/oIvMWOP+AAX8GMM+RQiiHAV/GwYu
         /aax+gaXk2xhsN5TyWK2zS1RrGnQW0jAD7t4JiKMc1x9gFOJn8eOG1Ta8Z5amLUHyO9i
         3L1Q==
X-Gm-Message-State: AOJu0Yy4CDr9jq4bXSphbbgTF09Bwuz/DstNKopNH2TCZFS4cDEjeCHc
	UcIcCyimPPUJLw0kifDeIOkD0A==
X-Google-Smtp-Source: AGHT+IGyL6ZY6hdOyOvfyj+HiZxWufZFo0Xq+Zb+kkzPvrXDz3dkWQvMrhwlUoHPwUGxmgTeTeONoA==
X-Received: by 2002:a6b:fb0a:0:b0:7b7:70b0:5dd6 with SMTP id h10-20020a6bfb0a000000b007b770b05dd6mr245922iog.34.1702389669618;
        Tue, 12 Dec 2023 06:01:09 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id w12-20020a056602034c00b007b45c1015b6sm2707078iou.31.2023.12.12.06.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 06:01:09 -0800 (PST)
Message-ID: <786e357b-df63-42bb-bc8a-b5fc8d6e9146@ieee.org>
Date: Tue, 12 Dec 2023 08:01:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20231211065420.213664-1-ayushdevel1325@gmail.com>
 <20231211065420.213664-2-ayushdevel1325@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20231211065420.213664-2-ayushdevel1325@gmail.com>
X-Rspamd-Queue-Id: 4C09E3EA1B
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.53:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: U3LP3CBD56SHJXIKYTU3BGK7Z6F3UME2
X-Message-ID-Hash: U3LP3CBD56SHJXIKYTU3BGK7Z6F3UME2
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V2 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U3LP3CBD56SHJXIKYTU3BGK7Z6F3UME2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 12/11/23 12:54 AM, Ayush Singh wrote:
> Make gb-beagleplay greybus spec compliant by moving cport information to
> transport layer instead of using `header->pad` bytes.
> 
> Greybus HDLC frame now has the following payload:
> 1. le16 cport
> 2. gb_operation_msg_hdr msg_header
> 3. u8 *msg_payload
> 
> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>

I would say that this is an improvement, but I wish I
had a better picture in mind of how this works.  The
initial commit provided some explanation, but even
there it talks about the "CC1352 (running SVC Zephyr
application)" and that leads me to wonder even how
the hardware is structured.  (I'm not really asking
you for this right now, but you have a reference to
something that provides some background, you should
provide it for context.)

Another general comment is that the use of HDLC seems
like it could be a more clearly separated layer that
could be used by other Greybus protocols or applications.
Maybe that's overkill, but it is a distinct layer, right?

I had a comment or two about using (void *) instead of
(u8 *), to reduce the need for explicit type casts.  But
I found that (u8 *) is used elsewhere in the Greybus code.

One comment I *will* share is that the serdev RX callback
has a const receive buffer.  I recommend you preserve that
"constness" in your code.

					-Alex

> ---
>   drivers/greybus/gb-beagleplay.c | 55 ++++++++++++++++++++++++---------
>   1 file changed, 41 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 1e70ff7e3da4..82dc8a25e6b9 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -85,17 +85,31 @@ struct hdlc_payload {
>   	void *buf;
>   };
>   
> +/**
> + * struct hdlc_greybus_frame - Structure to represent greybus HDLC frame payload
> + *
> + * @cport: cport id
> + * @hdr: greybus operation header
> + * @payload: greybus message payload
> + *
> + * The HDLC payload sent over UART for greybus address has cport preappended to greybus message
> + */
> +struct hdlc_greybus_frame {
> +	__le16 cport;
> +	struct gb_operation_msg_hdr hdr;
> +	u8 payload[];
> +} __packed;
> +
>   static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>   {
> -	u16 cport_id;
> -	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
> -
> -	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
> +	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
> +	u16 cport_id = le16_to_cpu(gb_frame->cport);
> +	u16 gb_msg_len = le16_to_cpu(gb_frame->hdr.size);
>   
>   	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
> -		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
> +		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
>   
> -	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
> +	greybus_data_rcvd(bg->gb_hd, cport_id, (u8 *)&gb_frame->hdr, gb_msg_len);
>   }
>   
>   static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
> @@ -336,10 +350,23 @@ static struct serdev_device_ops gb_beagleplay_ops = {
>   	.write_wakeup = gb_tty_wakeup,
>   };
>   
> +/**
> + * gb_message_send() - Send greybus message using HDLC over UART
> + *
> + * @hd: pointer to greybus host device
> + * @cport: AP cport where message originates
> + * @msg: greybus message to send
> + * @mask: gfp mask
> + *
> + * Greybus HDLC frame has the following format:
> + * 1. le16 cport
> + * 2. gb_operation_msg_hdr msg_header
> + * 3. u8 *msg_payload
> + */
>   static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
>   {
>   	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
> -	struct hdlc_payload payloads[2];
> +	struct hdlc_payload payloads[3];
>   	__le16 cport_id = le16_to_cpu(cport);
>   
>   	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
> @@ -348,14 +375,14 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
>   	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
>   		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
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
>   
> -	hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 2);
> +	hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 3);
>   	greybus_message_sent(bg->gb_hd, msg, 0);
>   
>   	return 0;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
