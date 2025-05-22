Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F20AC02A2
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 04:51:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 74613454CD
	for <lists+greybus-dev@lfdr.de>; Thu, 22 May 2025 02:51:50 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	by lists.linaro.org (Postfix) with ESMTPS id 926A5443AE
	for <greybus-dev@lists.linaro.org>; Thu, 22 May 2025 02:46:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=TnDEtbg9;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.160.182 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4947635914aso78305721cf.3
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 19:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1747882010; x=1748486810; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mr71AaCtvqVBAhTVUb1SE+JNl4iJF/6unTZctVh/yws=;
        b=TnDEtbg9iMvCbvegKhI5CSYAi8I34mPGNtCjTVH7T5ZtPHMk7TuOu9qpMglusqn+0f
         gxW/LrFSSN07HekDJiEF7mpC+DaAOUS/DEUFl3ocQSoI6Cm0AoM2ph8iC+G2ecHJ/cLK
         jAjrT1Q5LlgB0EKFwSvVKRdTq/EYQytzN3l+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747882010; x=1748486810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr71AaCtvqVBAhTVUb1SE+JNl4iJF/6unTZctVh/yws=;
        b=HhN1mSCYYcprZkzrLepAnf7DQ9ShPZywjwEyKRkSjN4n58MMMzDKEEhVcZ3wkWoYPL
         mxpM8ri3NffLymCE0PiCM3PUtZSA2PpaeClTrVGDg8sSAyvmDhAhF/6XbfU6a6t6hX3i
         IFUOt85qsJtzUhuqRCMjodbtJgRCx2xxUkBgcDrdOO6YgEp6h3lK1V28DpQmsd39YTjT
         yEXNC3nfjIRBGT+vnxae3hfM+9q1fOYG9tpwjPocSFi9xPXxSRkolZAoI8HyHOfA8+gs
         lMLvM04UieIkpxvC49+eCcDXbSdkuPFkQX4oXKprk54GdX7yb/Ik+mWvKgxisb6zGSew
         Y76w==
X-Forwarded-Encrypted: i=1; AJvYcCVVJFA0juiQK8MpqKaxTL/luf+yjl7iINbP8z/SKOW6z0RHJDYpne2AzNbyiulbVwctdJTTZSV/ud9jVg==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywuyk2oD9yT5V937mRn1X8y1O1BBsY7Co5wUBECvr/mfjUeGQmC
	u/Wu3I9WhE53N6WatpdWUpMCiJmfO//NoiJl9iFxWwdiCagAlqj/HZRm2aXU7nXTtQ==
X-Gm-Gg: ASbGnctHmUs3XRaKbMngsLkC1cK+0AV1E5g9TaLCK2xe/TeSmBHVJxAmHR2tXjAXLJf
	1eHBuWpTUR7fsjbvvDpZOF8SvOvfVO9KRoF7VdVkvg+IAsGOjTa057TYy8l8xmmIHJEORDJbFo8
	jbeRCui5alqKljTq6J0CZnbilc+65h4fdcL3sOnMQDovy59n/WXpsqnbYG4dvjjgOA4i9PWVXVT
	VYFbHnBgy5vlD0Y1QBV7GqlddJqq4AawcfOd9PLMPr17W9mPm1T8X6GYKH2xN7lpLJQ/+UHl0nV
	MEho67UClPeb+hL/h7sQRPHYfmHgmn3VnOijE7NamN3fZA1ug7W8dwhZhnyyUhhIIRA8ut90Zay
	J7YTOACztfA==
X-Google-Smtp-Source: AGHT+IFuRfWu7GcESNkglX3O7mC2+I8q2BLk8fPkB8g39depGVD2//DFqQSONTBqv71w+N66shUz0g==
X-Received: by 2002:a05:622a:2b09:b0:494:9fce:28f7 with SMTP id d75a77b69052e-494ae349eebmr398139451cf.17.1747882010085;
        Wed, 21 May 2025 19:46:50 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-494ae3d6d84sm92828951cf.16.2025.05.21.19.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 19:46:49 -0700 (PDT)
Message-ID: <9a612b07-fe02-40d6-a1d4-7a6d1266ed18@ieee.org>
Date: Wed, 21 May 2025 21:46:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?Q?Damien_Ri=C3=A9gel?=
 <damien.riegel@silabs.com>
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <2025051551-rinsing-accurate-1852@gregkh>
 <D9WTONSVOPJS.1DNQ703ATXIN1@silabs.com>
 <2025051612-stained-wasting-26d3@gregkh>
 <D9XQ42C56TUG.2VXDA4CVURNAM@silabs.com>
 <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <cbfc9422-9ba8-475b-9c8d-e6ab0e53856e@lunn.ch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.182:from];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[mail-qt1-f182.google.com:rdns,mail-qt1-f182.google.com:helo,ieee.org:mid,ieee.org:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[209.85.160.182:from,73.228.159.35:received];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Queue-Id: 926A5443AE
X-Spamd-Bar: --
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: POLNIO3W4B2JQXJMKWT6DHOXWH3SK3Z7
X-Message-ID-Hash: POLNIO3W4B2JQXJMKWT6DHOXWH3SK3Z7
X-Mailman-Approved-At: Thu, 22 May 2025 02:51:48 +0000
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Silicon Labs Kernel Team <linux-devel@silabs.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/POLNIO3W4B2JQXJMKWT6DHOXWH3SK3Z7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 5/18/25 10:23 AM, Andrew Lunn wrote:
>> I think Andrew pulled Greybus in the discussion because there is some
>> overlap between Greybus and CPC:
>>    - Greybus has bundles and CPorts, CPC only has "endpoints", which
>>      would be the equivalent of a bundle with a single cport
>>    - discoverability of Greybus bundles/CPC endpoints by the host
>>    - multiple bundles/endpoints might coexist in the same
>>      module/CPC-enabled device
>>    - bundles/endpoints are independent from each other and each has its
>>      own dedicated driver
>>
>> Greybus goes a step further and specs some protocols like GPIO or UART.
>> CPC doesn't spec what goes over endpoints because it's geared towards
>> radio applications and as you said, it's very device/stack specific.
> 
> Is it device specific? Look at your Bluetooth implementation. I don't
> see anything device specific in it. That should work for any of the
> vendors of similar chips to yours.
> 
> For 802.15.4, Linux defines:
> 
> struct ieee802154_ops {
>          struct module   *owner;
>          int             (*start)(struct ieee802154_hw *hw);
>          void            (*stop)(struct ieee802154_hw *hw);
>          int             (*xmit_sync)(struct ieee802154_hw *hw,
>                                       struct sk_buff *skb);
>          int             (*xmit_async)(struct ieee802154_hw *hw,
>                                        struct sk_buff *skb);
>          int             (*ed)(struct ieee802154_hw *hw, u8 *level);
>          int             (*set_channel)(struct ieee802154_hw *hw, u8 page,
>                                         u8 channel);
>          int             (*set_hw_addr_filt)(struct ieee802154_hw *hw,
>                                              struct ieee802154_hw_addr_filt *filt,
>                                              unsigned long changed);
>          int             (*set_txpower)(struct ieee802154_hw *hw, s32 mbm);
>          int             (*set_lbt)(struct ieee802154_hw *hw, bool on);
>          int             (*set_cca_mode)(struct ieee802154_hw *hw,
>                                          const struct wpan_phy_cca *cca);
>          int             (*set_cca_ed_level)(struct ieee802154_hw *hw, s32 mbm);
>          int             (*set_csma_params)(struct ieee802154_hw *hw,
>                                             u8 min_be, u8 max_be, u8 retries);
>          int             (*set_frame_retries)(struct ieee802154_hw *hw,
>                                               s8 retries);
>          int             (*set_promiscuous_mode)(struct ieee802154_hw *hw,
>                                                  const bool on);
> };
> 
> Many of these are optional, but this gives an abstract representation
> of a device, which is should be possible to turn into a protocol
> talked over a transport bus like SPI or SDIO.

This is essentially how Greybus does things.  It sets
up drivers on the Linux side that translate callback
functions into Greybus operations that get performed
on target hardware on the remote module.

> This also comes back to my point of there being at least four vendors
> of devices like yours. Linux does not want four or more
> implementations of this, each 90% the same, just a different way of
> converting this structure of operations into messages over a transport
> bus.
> 
> You have to define the protocol. Mainline needs that so when the next
> vendor comes along, we can point at your protocol and say that is how
> it has to be implemented in Mainline. Make your firmware on the SoC
> understand it.  You have the advantage that you are here first, you
> get to define that protocol, but you do need to clearly define it.

I agree with all of this.

> You have listed how your implementation is similar to Greybus. You say
> what is not so great is streaming, i.e. the bulk data transfer needed
> to implement xmit_sync() and xmit_async() above. Greybus is too much
> RPC based. RPCs are actually what you want for most of the operations
> listed above, but i agree for data, in order to keep the transport
> fully loaded, you want double buffering. However, that appears to be
> possible with the current Greybus code.
> 
> gb_operation_unidirectional_timeout() says:

Yes, these are request messages that don't require a response.
The acknowledgement is about when the host *sent it*, not when
it got received.  They're rarely used but I could see them being
used this way.  Still, you might be limited to 255 or so in-flight
messages.

					-Alex

>   * Note that successful send of a unidirectional operation does not imply that
>   * the request as actually reached the remote end of the connection.
>   */
> 
> So long as you are doing your memory management correctly, i don't see
> why you cannot implement double buffering in the transport driver.
> 
> I also don't see why you cannot extend the Greybus upper API and add a
> true gb_operation_unidirectional_async() call.
> 
> You also said that lots of small transfers are inefficient, and you
> wanted to combine small high level messages into one big transport
> layer message. This is something you frequently see with USB Ethernet
> dongles. The Ethernet driver puts a number of small Ethernet packets
> into one USB URB. The USB layer itself has no idea this is going on. I
> don't see why the same cannot be done here, greybus itself does not
> need to be aware of the packet consolidation.
> 
> 	Andrew

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
