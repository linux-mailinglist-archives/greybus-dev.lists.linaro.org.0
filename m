Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A67AC7F6
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 14:22:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1B95140C22
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 12:22:48 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by lists.linaro.org (Postfix) with ESMTPS id 7C54D3EC33
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 12:22:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PJDnidKC;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.44 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-277504a23a1so168406a91.0
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695558159; x=1696162959; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2vcY7tF/zX/vLERKQFBiyXpiUq72NnOnw1gtUdIzwY=;
        b=PJDnidKC/+nZ1GFem6UE/SOs5kd2haZ8L7ou0hzTReOKKQxpAtVISI0xUc/c41a7i6
         nmsDuhnF5x7Xn2LSTf6e3cWt9dZYv9ox/nNbncDKmxfFvhuWIUfffkYHgHVprWdhKxIH
         JyOLOUM2pBVJLa19LG3jsA1z/iDDV/9wLDxw8AuqQuw/JXH+rMdH5cqqKM/F4IjXHl+U
         3KB4JDkq5uVpjW+dv+ttJiVowFfZvHOcVmvXUjaik6fYs/QG2Ye7gPE0zLV9iQkal7MP
         q6JBlkOtoLrAuahhgniXYUsZHiOvuYBfH8SVQWlUy1TZxssZlGkYlfmKOETErXFXiqCh
         qsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695558159; x=1696162959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2vcY7tF/zX/vLERKQFBiyXpiUq72NnOnw1gtUdIzwY=;
        b=XTxlqixIXNjXrP5aKUOfo9y/Cuh9ndbInKPlHiu761eanme6KknwrYprJXukccC3wJ
         3uAcJ/6ERNfhCh3awmt3fB6Zg/SLRnETKuCpD2VmgusXq/oEIwiyRvONPYRF3yCC6VIE
         RyZDOMGF91ieR3U6bw5a5hGsCexISiZ59IdeFpTNFAGMHa8jwtXRQB8QqRiqm2BM22LM
         tCTlCNuKlE6d0BsLYTXPOnphnuCiTmnBpv+mrDlSfl/3CmgyEz9ARMSKSvQF/S0JcwJn
         5FGrU0perd9rGNAQogOjloiYnEnMrAo3y9/Q/HMMXPd+a1LWEvTKKGLrO2RZUXHMfSNh
         1a7Q==
X-Gm-Message-State: AOJu0Yw1axAPLBF2aS4Ya8ykL9dRIoG4CYqDxH6tZ5ugFAo+AdYv7Etx
	r6D1srGL6v/HyvikGKAGz+4bmOBm9hl94w==
X-Google-Smtp-Source: AGHT+IFzH0CilMUpxjK7Ai5MGsLE7MUvQd6UclHut0zH0m8PXgN/bwJ7pFeIcalNBKxMiMJwX7I/gg==
X-Received: by 2002:a17:90b:4ace:b0:274:98aa:72d8 with SMTP id mh14-20020a17090b4ace00b0027498aa72d8mr6467128pjb.3.1695558159500;
        Sun, 24 Sep 2023 05:22:39 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id y3-20020a170902864300b001b0358848b0sm6741970plt.161.2023.09.24.05.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Sep 2023 05:22:39 -0700 (PDT)
Message-ID: <69f8f5aa-075c-0dc1-7a5f-bd6978c71f53@gmail.com>
Date: Sun, 24 Sep 2023 17:52:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-2-ayushdevel1325@gmail.com>
 <0fd912a9-4aaa-d4bd-4ceb-7319d9f46db8@linaro.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <0fd912a9-4aaa-d4bd-4ceb-7319d9f46db8@linaro.org>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.44:from];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7C54D3EC33
Message-ID-Hash: ZWQ6K6YIVRPJBI757SUWWZLUYZXDQGAS
X-Message-ID-Hash: ZWQ6K6YIVRPJBI757SUWWZLUYZXDQGAS
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 1/3] dt-bindings: Add beagleplaycc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZWQ6K6YIVRPJBI757SUWWZLUYZXDQGAS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

> So this is "Texas Instruments Simplelink CC1352P7 wireless MCU"? Since
> you do not have any fixed feature and run general-purpose OS, then this
> should be rather compatible matching actual hardware (so ti,cc1352p7).
Yes, it is "Texas Instruments Simplelink CC1352P7 wireless MCU". Since 
the docs suggest that all functionality of the device should be 
mentioned in the bindings rather than just what is being used, I suppose 
all the other properties can be defined as optional? The bindings for 
this device do exist in Zephyr, so I guess that can be re-purposed for 
Linux kernel. However, I think in that case it should be moved into 
`soc` instead of `net`?
>
>> +
>> +maintainers:
>> +  - Ayush Singh <ayushdevel1325@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: beagle,play-cc1352
>> +
>> +required:
>> +  - compatible
> Still no resources? I asked about it last time and you did not answer
> anything.
Sorry, I missed that. By resources, I think you mean pins, peripherals, 
etc right?


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
