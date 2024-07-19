Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 19139937D84
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 23:40:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F3A19434D7
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 21:40:01 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	by lists.linaro.org (Postfix) with ESMTPS id CC49040EBD
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 21:39:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Y5U8wl7W;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.210.45 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-704473c0698so1106166a34.3
        for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1721425198; x=1722029998; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxURwrQjaWVMnPupTe3e2QhQiBnQCCXPKt1vU7CQERU=;
        b=Y5U8wl7W+OLw5D24JjgXzJ/Bnstm/f0nQ6jvnPO6Q2mtYPfYjfjQFFOnS3xze8MlR/
         Brvu/6XE1r5iNe0XWwYodeiVp0K3fW9YRR97Jkggg9rHT8WTcZQQhErwCZaClT8P4ASM
         uM0FWtb0CrxYSWlCPPYsjhOyffgJvWNGy1AvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721425198; x=1722029998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxURwrQjaWVMnPupTe3e2QhQiBnQCCXPKt1vU7CQERU=;
        b=CVWPNFbbZXklqT/fpc+/ZRNaClcrBEjyN5pq9r/ieGLUkbkSq9s8ZP3/ZORljcHOpE
         9kWqzKmTaXzAbKeNC+LMSz92wN8uN6H+lR5H6N1uAKfER2zq3OSB52sp3Jb6ayyFX9K/
         LQXFSXYKq5BNjxwXrBlUuMjPguhOtQ+lKdikhjnfB7Z20EkAHnUTaIZgln3VdBJrPXuU
         YJa6eWXkdlJhSWHouD0hoJxz756HmkNRRLh9RE6lc8aPo/dSEbZ8Io9HYSz3ioAWw9wV
         kbR9HKKF6e1ucI4OrF8V+90AQyjyz51bi3g5o2RbHHCs039J20YyA1mWeml4TlC4BI4C
         h6MA==
X-Forwarded-Encrypted: i=1; AJvYcCXZENAo23rRaw6ki4qBYvI8Tn+87wtHy+RBpbsLcgoNKzWYyM+6kfYE34xTe5aR/81+owBWj7C57jQLxMMHD6XvO4xOLMELwKatngsE
X-Gm-Message-State: AOJu0YwkhD1SyamigW3x8rhCtGkTudSXNpc2s8vNerjzDjIZ7Jjf6Jhu
	JiteJJgLL/Ys70AYHdUA4N5AQMuKacUKnoRe1URjHmErt0xueIdMhPbcW5pz3g==
X-Google-Smtp-Source: AGHT+IE74f2iNObwpJtxfcq8M2viSwuF/AsMKv4hekSdNy/d0euPZyuEg0mshxbk4LRUVX4+1T2w8Q==
X-Received: by 2002:a05:6830:418e:b0:703:7786:edab with SMTP id 46e09a7af769-708e379aa81mr11905980a34.4.1721425198123;
        Fri, 19 Jul 2024 14:39:58 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-708f6189bd5sm460642a34.65.2024.07.19.14.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 14:39:57 -0700 (PDT)
Message-ID: <e7e88268-a56b-447c-9d59-6a4eb8fcd25a@ieee.org>
Date: Fri, 19 Jul 2024 16:39:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>, Hariprasad Kelam <hkelam@marvell.com>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
 <20240719-beagleplay_fw_upgrade-v1-3-8664d4513252@beagleboard.org>
 <Zppeg3eKcKEifJNW@test-OptiPlex-Tower-Plus-7010>
 <b3269dc8-85ac-41d2-8691-0a70b630de50@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <b3269dc8-85ac-41d2-8691-0a70b630de50@lunn.ch>
X-Rspamd-Queue-Id: CC49040EBD
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.45:from];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: PGS4SVCU62MAVQVB3WFIV6UR2IJCOEQP
X-Message-ID-Hash: PGS4SVCU62MAVQVB3WFIV6UR2IJCOEQP
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address
CC: Ayush Singh <ayush@beagleboard.org>, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] greybus: gb-beagleplay: Add firmware upload API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PGS4SVCU62MAVQVB3WFIV6UR2IJCOEQP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 7/19/24 2:15 PM, Andrew Lunn wrote:
>>>   drivers/greybus/Kconfig         |   1 +
>>>   drivers/greybus/gb-beagleplay.c | 625 +++++++++++++++++++++++++++++++++++++++-
> 
>>> +static u8 csum8(const u8 *data, size_t size, u8 base)
>>> +{
>>> +	size_t i;
>>> +	u8 sum = base;
>> follow reverse x-mas tree
> 
> Since this is not networking, even thought it was posted to the netdev
> list, this comment might not be correct. I had a quick look at some
> greybus code and reverse x-mas tree is not strictly used.
> 
> Please see what the Graybus Maintainers say.

Andrew is correct.  The Greybus code does not strictly follow
the "reverse christmas tree" convention, so there is no need
to do that here.  Please understand that, while checkpatch.pl
offers good and well-intentioned advice, not everything it
warns about must be fixed, and in some cases it suggests things
certain maintainers don't agree with.

					-Alex

> 	Andrew

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
