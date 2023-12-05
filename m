Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B5805345
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Dec 2023 12:45:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53CFE440C7
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Dec 2023 11:45:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 919713EDC1
	for <greybus-dev@lists.linaro.org>; Tue,  5 Dec 2023 11:45:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=XkgSgTOC;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d0897e99e0so14595265ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 05 Dec 2023 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701776738; x=1702381538; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifjZic9V2+iDg+N0MCNpQXnm6i6pbqN+fLGdm8ADAvI=;
        b=XkgSgTOCxnckXMg1ZtdpU99Mx8Vshdy5ORDyet5tf5jEt1chA190nLSGLnU1NDyUed
         dRDWGGwMYskHDe9heMRxEVITTJjRbfiAhYy15IRebOSpsLcQBhcIXVKkLtmx1zv1icEH
         nRg4Uybv939bvLa2plKgEB4ngVeSEQpkuiQvlsX4cWvCP5yTDDwc1yB3NCifF9qw5bV1
         VHrhH3z6zKXp8fsaOkMl67sYSx1bSgjh0JuSICbq81EiHLlyRIZZVva3JeRl9d2vrSPG
         e/Vnp8VMFT1dk4kfbtQDKpgd6/S+BVA+r+VMcjZdrBDRQMUBnWzfYIhe6X10Jy+2bBsB
         xSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776738; x=1702381538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifjZic9V2+iDg+N0MCNpQXnm6i6pbqN+fLGdm8ADAvI=;
        b=ANxM77Apjm7hFW6sLcpmGREvvym4kLxCcvNeovRcdGvbxFJxm4Ln3H2CtI2FXCbfwD
         kgfu9n7zCZ5Rsvau4fFRxLWIgZhG0mxcIV7PRijukiZow/orzbbRAw+j/dWzvaafAMWP
         wQi/zGo2ZYgp44VB2oKNAkeXTVe+lEi9FOcHyZujDwkGmxqWhjpOYbSvwvAPPaM/6582
         lrfUp9gIAaJF35sGWmSQv/TD7zG914ckZX9QrD3pDFETbLvmJEh+5KNNdaiBpLvtleov
         6+cNa0QcHMl49b6FkOfioM7Bg3CQoSFCP16WQaytMDDmaivZCKFA0QE1HnlEI57nYtvF
         JmoQ==
X-Gm-Message-State: AOJu0YyQh7FPig1TR8iiDZDqAhTlu83C7Sxzo/hFItvlQRIxx8oySbhk
	Vg0WrBhl0y6GYy3ldnwx7H8=
X-Google-Smtp-Source: AGHT+IFKTerv0BHVyBYqJWcQX6206WE3geXyFHnM1ck+LASjK9ZVLI5oV7n5Gcg5NXT0js6mgFchqQ==
X-Received: by 2002:a17:902:ecc7:b0:1d0:c6fd:3173 with SMTP id a7-20020a170902ecc700b001d0c6fd3173mr355177plh.42.1701776738436;
        Tue, 05 Dec 2023 03:45:38 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3e:53bf:50c7:2988:e019:4b97? ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001d0cd9e4248sm316501plg.196.2023.12.05.03.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 03:45:38 -0800 (PST)
Message-ID: <4cafbb5a-8ecd-407e-81a0-76d6505d013b@gmail.com>
Date: Tue, 5 Dec 2023 17:15:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg KH <gregkh@linuxfoundation.org>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
 <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
 <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
 <2023120515-mongrel-undertook-6e5a@gregkh>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023120515-mongrel-undertook-6e5a@gregkh>
X-Rspamd-Queue-Id: 919713EDC1
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:url,intel.com:email];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: KLU3UVIRSRA2Z5S425DXAYGOBVNLL4JX
X-Message-ID-Hash: KLU3UVIRSRA2Z5S425DXAYGOBVNLL4JX
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KLU3UVIRSRA2Z5S425DXAYGOBVNLL4JX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit


On 12/5/23 05:44, Greg KH wrote:
> On Mon, Dec 04, 2023 at 09:58:55PM +0530, Ayush Singh wrote:
>> On 12/4/23 19:42, Johan Hovold wrote:
>>> On Mon, Dec 04, 2023 at 06:40:06PM +0530, Ayush Singh wrote:
>>>> Ensure that the following values are little-endian:
>>>> - header->pad (which is used for cport_id)
>>>> - header->size
>>>>
>>>> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
>>>> Reported-by: kernel test robot <yujie.liu@intel.com>
>>>> Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
>>>> Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
>>>> ---
>>>> V3:
>>>> - Fix endiness while sending.
>>>> V2: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC/
>>>> - Ensure endianess for header->pad
>>>> V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/
>>>>
>>>>    drivers/greybus/gb-beagleplay.c | 9 +++++----
>>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
>>>> index 43318c1993ba..8b21c3e1e612 100644
>>>> --- a/drivers/greybus/gb-beagleplay.c
>>>> +++ b/drivers/greybus/gb-beagleplay.c
>>>> @@ -93,9 +93,9 @@ static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
>>>>    	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
>>>>    	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
>>>> -		hdr->operation_id, hdr->type, cport_id, hdr->result);
>>>> +		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
>>>> -	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
>>>> +	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
>>> This looks broken; a quick against mainline (and linux-next) check shows
>>> cport_id to be u16.
>>>
>>> I think you want get_unaligned_le16() or something instead of that
>>> memcpy() above.
>> Thanks, will do.
>>> But that just begs the question: why has this driver repurposed the pad
>>> bytes like this? The header still says that these shall be set to zero.
>> So, the reason is multiplexing. The original gbridge setup used to do this,
>> so I followed it when I moved gbridge to the coprocessor (during GSoC).
>>
>> Using the padding for storing cport information allows not having to wrap
>> the message in some other format at the two transport layers (UART and TCP
>> sockets) beagle connect is using.This also seems better than trying to do
>> something bespoke, especially since the padding bytes are not being used for
>> anything else.
>>
>> The initial spec was for project Ara (modular smartphone), so the current
>> use for IoT is significantly different from the initial goals of the
>> protocol. Maybe a future version of the spec can be more focused on IoT, but
>> that will probably only happen once it has proven somewhat useful in this
>> space.
> Please don't violate the spec today this way, I missed that previously,
> that's not ok.  We can change the spec for new things if you need it,
> but to not follow it, and still say it is "greybus" isn't going to work
> and will cause problems in the long-run.
>
> Should I just disable the driver for now until this is fixed up?
>
> thanks,
>
> greg k-h

Well, I will look into some ways to pass along the cport information 
(maybe using a wrapper over greybus message) for now. However, I would 
prefer having some bytes in greybus messages reserved for passing around 
this information in a transport agnostic way.

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
