Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 279456D96D5
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Apr 2023 14:12:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 272803F52D
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Apr 2023 12:12:24 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	by lists.linaro.org (Postfix) with ESMTPS id 1BFEF3F33F
	for <greybus-dev@lists.linaro.org>; Thu,  6 Apr 2023 12:12:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=NwMNqjFo;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.178 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f178.google.com with SMTP id r19so9196908ilj.6
        for <greybus-dev@lists.linaro.org>; Thu, 06 Apr 2023 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1680783139; x=1683375139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiCBgdIy8eq03QW0G9vGas2n0jUS6qAuhUQkgRBSPcQ=;
        b=NwMNqjFo8wThsLoZnDszHEnFswnjMOJJDEW3C54H8Ov6w67W4Zhl01fE+6JYjZmDm/
         xtSEYMk4b8xGQuCxCAf9rX4nV9ba38zCSL8205DjHnRikKbhpAh0tEVjOmszWsUO3fWf
         xP7huhTdNrrad2FMCqtLrE6Ui5JpB5+vBL2dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783139; x=1683375139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiCBgdIy8eq03QW0G9vGas2n0jUS6qAuhUQkgRBSPcQ=;
        b=s7l2MeU4Wsfu1J2FUWtzYf1xSWPCQwv9houKqy/IWLwUAnhU/s73gYCubXSKGJaG6A
         mIWJhVJOg/3qenSBmHUGOzUBXiT3RFR19K0UD1qphHpA+7bA3ySeG4ogHdiFoHgz41r4
         792zyy/oO6Lce59FpFSIwJfcfBignIqszDQEY7Tb4/61UClbfUfixDWRFAMEy2ILbZcR
         bpzDuCSVdoRPaXxMkv2+Gw8zo5yCNcBKnlqud4fvUiMYJ6l7iHOvdPTjKRsI451bnths
         W+Wu6n1bNt2DUuUCrIcWiOJuRNfTlw1Pf8FccWdgvn9cncVpXw0binwkyOF6+xfy4ahL
         ivmg==
X-Gm-Message-State: AAQBX9d1oHSt3ffL45ugOLyDfSHtifP74sAf6WQVazY0hb39Wb5viWva
	hodfQ5tlmK1ubby+scM8xrpLKw==
X-Google-Smtp-Source: AKy350aXJuXrIoQCoFQrtu/oOr2bIVumcXfubXv54/hMkKw/UalyjaTZpr3nJhbc+I/QXoe/ZBHL+A==
X-Received: by 2002:a92:c94d:0:b0:317:eef2:f5cc with SMTP id i13-20020a92c94d000000b00317eef2f5ccmr7197520ilq.10.1680783139465;
        Thu, 06 Apr 2023 05:12:19 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l13-20020a92290d000000b00326ca02f30dsm293549ilg.65.2023.04.06.05.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:12:18 -0700 (PDT)
Message-ID: <b80921e2-9c77-a0dd-9b70-f2ad805f71ff@ieee.org>
Date: Thu, 6 Apr 2023 07:12:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
References: <2023040613-huntsman-goldsmith-4a41@gregkh>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2023040613-huntsman-goldsmith-4a41@gregkh>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1BFEF3F33F
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,ieee.org:dkim,mail-il1-f178.google.com:helo,mail-il1-f178.google.com:rdns,oregonstate.edu:email,linuxfoundation.org:email,android.mk:url];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.166.178:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.178:from]
Message-ID-Hash: ZNRAMLMODC2VQHGI2BMZD2TG6UV4RFC5
X-Message-ID-Hash: ZNRAMLMODC2VQHGI2BMZD2TG6UV4RFC5
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jack Schofield <schofija@oregonstate.edu>, Vaibhav Nagare <vnagare@redhat.com>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: drop loopback test files
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZNRAMLMODC2VQHGI2BMZD2TG6UV4RFC5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/6/23 3:18 AM, Greg Kroah-Hartman wrote:
> The greybus loopback test tool does not belong burried down in a
> driver-specific directory.  If it is needed, it should be somewhere
> else, like in the testing directory.  But as the loopback driver is
> probably never going to be merged out of the staging directory, let's
> just delete the test alltogether for now.  If it's needed in the future,
> it can be brought back with a revert.
> 
> Also, having an Android.mk file in the kernel source tree breaks some
> Android build systems when trying to build from a read-only source tree,
> the report of which prompted this being a good reason to remove it as
> well.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Jack Schofield <schofija@oregonstate.edu>
> Cc: Vaibhav Nagare <vnagare@redhat.com>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

That's a surprising amount of code.  And perhaps there
are better ways of exposing this type of information.
Anyway, no objection here.

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/greybus/tools/.gitignore      |   2 -
>   drivers/staging/greybus/tools/Android.mk      |  10 -
>   drivers/staging/greybus/tools/Makefile        |  33 -
>   drivers/staging/greybus/tools/README.loopback | 198 ----
>   drivers/staging/greybus/tools/lbtest          | 169 ---
>   drivers/staging/greybus/tools/loopback_test.c | 979 ------------------
>   6 files changed, 1391 deletions(-)
>   delete mode 100644 drivers/staging/greybus/tools/.gitignore
>   delete mode 100644 drivers/staging/greybus/tools/Android.mk
>   delete mode 100644 drivers/staging/greybus/tools/Makefile
>   delete mode 100644 drivers/staging/greybus/tools/README.loopback
>   delete mode 100755 drivers/staging/greybus/tools/lbtest
>   delete mode 100644 drivers/staging/greybus/tools/loopback_test.c
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
