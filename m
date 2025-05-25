Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B6AC34EC
	for <lists+greybus-dev@lfdr.de>; Sun, 25 May 2025 15:29:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 972B943C05
	for <lists+greybus-dev@lfdr.de>; Sun, 25 May 2025 13:29:32 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	by lists.linaro.org (Postfix) with ESMTPS id A53C643C05
	for <greybus-dev@lists.linaro.org>; Sun, 25 May 2025 13:29:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=PxfkL5FR;
	spf=neutral (lists.linaro.org: 209.85.215.178 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1396171fb1so613436a12.2
        for <greybus-dev@lists.linaro.org>; Sun, 25 May 2025 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1748179769; x=1748784569; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JunTyBpJL6+oKjMZqdku/3S33hw0OmcudpKxQw9Ic74=;
        b=PxfkL5FRiyLZIEMBGdEYO9aD5iEa0RgACv2WUbv2nHaHfPIBlfyNb1XE4JP4dbZEVP
         sQV3GNsNRU6Yrzoe01UM/nXYc/tPDLcl7QRmewhCC76dT+7Rvr7XFsR0/8CHVbwK2hJW
         A/SoM4wc7DMBziI8Nei/tVk2OYcU1G8ZQMaOH7T1/KgdWU1eblAwiYGpcaKG7RRz3YnL
         WfpehRBL5GjNf3IScpm5CK9it6zD37cN2fSPPA9weWi0CT/CJuvfQ33dwFMbNIuNjTjK
         WIBglKyVOmETXvGmydNpLRGMoPNb6OjfPlTyYJHsdw/gBde86Z64nd5yhC5kMlpn2t9k
         YAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748179769; x=1748784569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JunTyBpJL6+oKjMZqdku/3S33hw0OmcudpKxQw9Ic74=;
        b=JY3TnSULOW/hTmDVe5sXbBRlHewBBlpzZzKLCFlVlHC8hUIXBkQVdZIb3054Dzmt8i
         x+hkEAQj7ejUXStXgJ9Tj4w4I3xZLOs7ygeilQ4TTFF41b6wpFeFy/UR5AY/AQ+dkW2A
         KwbGIzSYrAlGn/qellipB5PjrcbfGaWSXrw8eLshtz+4hQPGVgmBc6Kj+U70uqqnP2cR
         Qzj/aKpECdcas5CdaacbhdUiCMDwl/kzi2mPXymuhSgiYlqCRjoxWMxP9vKVSwhlagzw
         id1dVABniJmoTSM6YTPIBziRozfVjcpff7Cd9wXAvjwxo2x4scp5iXBD9Ww1BmFsE+PY
         T+FA==
X-Gm-Message-State: AOJu0YzakyCa+NXRSdJDnkshc/Si0l/aE+ZSvToHEKjrBV1ZkV47jHId
	o4bni/JRRjl3/ZLnxTNFRUgdn8M4IVIcUtEJd06PxQqFwbefXWH4fJVshCqh92/UyGY2AHMup2P
	ySoQ=
X-Gm-Gg: ASbGncu1M6ZoAfwiGOFMNZeGVAaKSbPmaTxKFth/0vxaz5Vg8bZb8p79aKrJfzBT/4l
	1gb8fR7SkWd1epH+PIbByxPAS35RzW7oDPxDSuzAzmKNA24AdrOieOT8sp60VTKH0ASbGNjOIT2
	o6UPxh5eZTuzwAGUHmtjV7DPkY1isAD5XMj6FsO8ehnglpH7HM5boUinEuyw6NUNpcHu+RAUq6u
	cNx5cSpYJ8uGVRLm+FDqePR6EUDfpo8bh7Vwz6IwUWrIhTfIdVtTQNzJxYyc+p8ik3qJtvQLvdz
	X/WQerIQWEcG3eJKAXTzfY38twu+0yrQGrq/U/q8HFRTQ5u9ctFh4EJl+fi317RXmQLxrr0nn0P
	w2nfS8M2hFvZlx+ruo5qTyINpChWlcTajAmjR9I4=
X-Google-Smtp-Source: AGHT+IFBrikxsSjZFkgRdn6fTSb4sgjPERXCS6/dWVw0lNoBGoEPPsg/XcVJklcqdDsSTSPYtWAWNQ==
X-Received: by 2002:a05:6a20:2d0c:b0:216:1476:f71 with SMTP id adf61e73a8af0-2188c3b48e1mr9233056637.39.1748179769285;
        Sun, 25 May 2025 06:29:29 -0700 (PDT)
Received: from ?IPV6:2401:4900:1f3f:9798:c9f3:310c:3656:5b7d? ([2401:4900:1f3f:9798:c9f3:310c:3656:5b7d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5ab7fsm15469330a12.15.2025.05.25.06.29.27
        for <greybus-dev@lists.linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 06:29:28 -0700 (PDT)
Message-ID: <fa7adc62-110b-4828-9ab0-ce4420407a9a@beagleboard.org>
Date: Sun, 25 May 2025 18:59:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: greybus-dev@lists.linaro.org
References: <20250512012748.79749-1-damien.riegel@silabs.com>
 <6fea7d17-8e08-42c7-a297-d4f5a3377661@lunn.ch>
 <D9VCEGBQWBW8.3MJCYYXOZHZNX@silabs.com>
 <f1a4ab5a-f2ce-4c94-91eb-ab81aea5b413@lunn.ch>
 <D9W93CSVNNM0.F14YDBPZP64O@silabs.com>
 <65cc6196-7ebe-453f-8148-ecb93e5b69fd@ieee.org>
 <DA3STV21NQE0.23SODSDP37DI7@silabs.com>
 <db54fe16-ae7d-410c-817b-edb4faa6656c@lunn.ch>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <db54fe16-ae7d-410c-817b-edb4faa6656c@lunn.ch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-1.13 / 15.00];
	BAYES_HAM(-0.83)[85.18%];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.178:from];
	R_SPF_NEUTRAL(0.00)[?all];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[2401:4900:1f3f:9798:c9f3:310c:3656:5b7d:received,209.85.215.178:from];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Queue-Id: A53C643C05
X-Spamd-Bar: -
Message-ID-Hash: FXZLFZFYLUQ3723YJJSKC5CFSTBTJXW4
X-Message-ID-Hash: FXZLFZFYLUQ3723YJJSKC5CFSTBTJXW4
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC net-next 00/15] Add support for Silicon Labs CPC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FXZLFZFYLUQ3723YJJSKC5CFSTBTJXW4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 5/24/25 01:36, Andrew Lunn wrote:

>> I don't really know about UniPro and I'm learning about it as the
>> discussion goes, but one of the point listed on Wikipedia is
>> "reliability - data errors detected and correctable via retransmission"
>>
>> This is where CPC could come in, probably with a different name and a
>> reduced scope, as a way to implement reliable transmission over UART,
>> SPI, SDIO, by ensuring data errors are detected and packets
>> retransmitted if necessary, and be limited to that.
> You mentioned HDLC in the past. What is interesting is that HDLC is
> actually used in Greybus:
>
> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/greybus/gb-beagleplay.c#L581
>
> I've no idea if its just for framing, or if there is also retries on
> errors, S-frames with flow and error control etc. There might be code
> you can reuse here.
>
> 	Andrew


It was mostly for framing. However, it does have CRC32 check to ensure 
the data validity in transport. I was using normal greybus ack and nack 
to trigger the greybus layers on the Zephyr firmware side to retry.


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
