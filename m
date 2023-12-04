Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 35272803A48
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Dec 2023 17:29:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 185A343C4B
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Dec 2023 16:29:08 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	by lists.linaro.org (Postfix) with ESMTPS id 00A563F65C
	for <greybus-dev@lists.linaro.org>; Mon,  4 Dec 2023 16:29:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="S6QLf/QI";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ce387bcb06so853748b3a.0
        for <greybus-dev@lists.linaro.org>; Mon, 04 Dec 2023 08:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701707341; x=1702312141; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dna9IRTvJmD8ExOInd9+w4ObVdAr/u4RKwVkYvL9yHY=;
        b=S6QLf/QIx05JGYHn/sG9g6aRw6/TQtqc27WI0GN9KNFB5ECtoNm1xUHUNRYIRcjk4X
         MEwbOvSaFIoo4W2e5cd+OqRoQYyrvWxFzERm0i3Qc4H9fFg0XhiXuqHjCl680vp+60ua
         92K64zyDLJ04ohY22VSO+8DxMENiJiIzKB7BWpqbfjSdCVNw+5QHw7gGwA32/EYMrnr7
         stRE4dv8YJLokOgT7jA+lurgKbDCidRzFEqxoy9/YxKiPnSmt9fSZY9UoF2bTSi76de/
         m4oLbVVPckzOVxsdHl/8j+Qxsp4SjylqgiznxVloZS7Ly+QUAXOuO/Gs3uvWFU1bUWEN
         /ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707341; x=1702312141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dna9IRTvJmD8ExOInd9+w4ObVdAr/u4RKwVkYvL9yHY=;
        b=cU45IOKpFdg03w90SlOJYZtMRiogAXte7DZYwYxCGi+fkM3lN/FQEXDnCnh6zwwsKF
         2xMhu4drNQjKulsQzUzq95UgOQBRSs+dLOWr1efrX9XWbttdX/jeK8frC4QIuCoYwIf7
         01q6/1iKKPBVd4WK/HWK2qP9V/RyZjc24/wqA3/PDWg6r29wGYaWxya22mIfvdKl/Kkm
         jJ0hoDlS+M0BQHGyrhZZ/Wo22ziec50YfBOlGXFPPoYtYtnrFui2N7/b3Vhz62LD+Zq+
         Nm0WvNGJHNNpgg/VTcXeCIYvqnIdNPLeGDe1dAGSleBfDZsVIl6YDARiEPDI+UrEw1AT
         ANzA==
X-Gm-Message-State: AOJu0YyFfWpxPW4N+i35IKapgvoXCZ9znnBjpG6qcmarynVmLDI1CObj
	eLZJ2LkcDv5vjLqLq96uYD4=
X-Google-Smtp-Source: AGHT+IG5K3i8a2a+1KXgVnHwtc2SefenxymyOCDG3NeLGydXF6V2t+WuJa/YBa3tPD/Jjd6A2oF5cA==
X-Received: by 2002:a17:903:11c8:b0:1cf:5760:43f9 with SMTP id q8-20020a17090311c800b001cf576043f9mr2277719plh.64.1701707340915;
        Mon, 04 Dec 2023 08:29:00 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3e:53bf:50c7:2988:e019:4b97? ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902b20900b001cf5d0e7e05sm3720816plr.109.2023.12.04.08.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:29:00 -0800 (PST)
Message-ID: <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
Date: Mon, 4 Dec 2023 21:58:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
 <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
X-Rspamd-Queue-Id: 00A563F65C
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.169:from];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 2NODXWFWPX6RGF56ZSRG27E3UJUWVR6W
X-Message-ID-Hash: 2NODXWFWPX6RGF56ZSRG27E3UJUWVR6W
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2NODXWFWPX6RGF56ZSRG27E3UJUWVR6W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 12/4/23 19:42, Johan Hovold wrote:
> On Mon, Dec 04, 2023 at 06:40:06PM +0530, Ayush Singh wrote:
>> Ensure that the following values are little-endian:
>> - header->pad (which is used for cport_id)
>> - header->size
>>
>> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
>> Reported-by: kernel test robot <yujie.liu@intel.com>
>> Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>> ---
>> V3:
>> - Fix endiness while sending.
>> V2: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC/
>> - Ensure endianess for header->pad
>> V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/
>>
>>   drivers/greybus/gb-beagleplay.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
>> index 43318c1993ba..8b21c3e1e612 100644
>> --- a/drivers/greybus/gb-beagleplay.c
>> +++ b/drivers/greybus/gb-beagleplay.c
>> @@ -93,9 +93,9 @@ static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>>   	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
>>   
>>   	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
>> -		hdr->operation_id, hdr->type, cport_id, hdr->result);
>> +		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
>>   
>> -	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
>> +	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
> This looks broken; a quick against mainline (and linux-next) check shows
> cport_id to be u16.
>
> I think you want get_unaligned_le16() or something instead of that
> memcpy() above.
Thanks, will do.
>
> But that just begs the question: why has this driver repurposed the pad
> bytes like this? The header still says that these shall be set to zero.

So, the reason is multiplexing. The original gbridge setup used to do 
this, so I followed it when I moved gbridge to the coprocessor (during 
GSoC).

Using the padding for storing cport information allows not having to 
wrap the message in some other format at the two transport layers (UART 
and TCP sockets) beagle connect is using.This also seems better than 
trying to do something bespoke, especially since the padding bytes are 
not being used for anything else.

The initial spec was for project Ara (modular smartphone), so the 
current use for IoT is significantly different from the initial goals of 
the protocol. Maybe a future version of the spec can be more focused on 
IoT, but that will probably only happen once it has proven somewhat 
useful in this space.

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
