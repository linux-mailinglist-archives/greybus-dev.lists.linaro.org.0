Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3QcKNQvJKmrvwwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2026 16:41:15 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B6672C8A
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2026 16:41:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=ieee.org header.s=google header.b=LdLH3lvf;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ieee.org (policy=quarantine)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B50E40A03
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jun 2026 14:41:14 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	by lists.linaro.org (Postfix) with ESMTPS id F32FB3F7A5
	for <greybus-dev@lists.linaro.org>; Thu, 11 Jun 2026 14:24:55 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e6b5c374e5so962154a34.0
        for <greybus-dev@lists.linaro.org>; Thu, 11 Jun 2026 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1781187895; x=1781792695; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0Caby6kbsKCRleFf2h8DzUz3LzcAnpcjf6XzhnJ/Kc=;
        b=LdLH3lvf8rwvfI+u5btF3o7WVa6YiqPm8GA0WfivOBgEu1pIDI8RlZ+PZC1YfsJxkv
         4CBDZmbEYUsDMvvrSTL7G3Fwe3woXIPj3MI/sFI4kgwh4xVm3Zzm4CG8RH4jvwlOF15G
         +qFPgML0rU0sTyMYzfCSIb4SlN7SJKdvl5/Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781187895; x=1781792695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0Caby6kbsKCRleFf2h8DzUz3LzcAnpcjf6XzhnJ/Kc=;
        b=DIz1784T8d+xzD7pxtQfM425Cw6HMQWxlZ0i0VajC7u0mLqk3lOd69Rfcjx9ei+M0x
         OtHqVCNd4kRKwc58Vaq1AbkU3ZaAfIBPNCtImQJXwZIaqRDmjTa2ErynIMk9LxYO/KLa
         d9ORGCvy1UwE24LtDFTwvmA1dxYd9J6bA4q0XuTMPzXHSZQFOoPmgqNDNXqJ6q5JENDC
         bsQdbbt7zSq7Zho3WMkCcvTKdu8SCLbblnHOgcHja4AO7iljr9vihjaUZpXct65s2L5B
         lx84lRJLgXgICosJbUYRmin4Sk35+rPWXgtNZFOprL3v4Rn6lh42rKH6Bp9TyoXxuwqA
         Z6mQ==
X-Gm-Message-State: AOJu0Yx+KtpjddIR4DeOnRFcmJ7zvqoCjunEn40/+Rx9tc8eJxiYdZlX
	zRapY7g9D48/Eapwo8h0ojN95gOjBPYm6/jqvS/qyoY3ijfNOIsxaDNY6oxOiH9Y8Q==
X-Gm-Gg: Acq92OHt+sXQcv7ahcshLlxYCWt5LtDaKzvwv51VAye0/i3oou6rU3K+lev+q/i1aIi
	WizDlAwM3/M98YYXH1pnvei+cDJW3kAO8ENFP/BmJ/7cRNnMdj9rxpP9drp7nN0xSa7ash72VPP
	YHL5/qeJ1rHgfJhzHcBJwunHJ+Ev8AIqvG/slWuKDJex/kF8vcbDRQgVPVtjkc6hcXiCszpHUma
	ooIF6tK8li6rZONn3dCf+/9iys9KIyyEBNlH4pWNdrfsAZpny9lP8hlWulGDWPTdMra7ogwnR+C
	hBF70bkcjRuPSAsos83+SXZTeQts7tMVT/O4GM2mX0oWLMbBYNGpDZGnV0ARJXDM5ElGJ0QJ/sq
	4Vg5jBri2STftz3sNoItEfFLlZQrE0UzQgitQoa/nGThHa33RFsMm8f8oXI3Hv9LJvGtp9l9G3N
	u3wrAnnija7HWMdXAaHFuQJ3tIwLa4
X-Received: by 2002:a05:6830:4c16:b0:7e6:d7b3:76f4 with SMTP id 46e09a7af769-7e773c80bffmr1836830a34.0.1781187895242;
        Thu, 11 Jun 2026 07:24:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7e774ceef97sm1340773a34.23.2026.06.11.07.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 07:24:54 -0700 (PDT)
Message-ID: <ff3cfa53-b385-4c3b-aab0-6402ecc23249@ieee.org>
Date: Thu, 11 Jun 2026 09:24:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rhys Tumelty <rhys@tumelty.co.uk>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260610173026.1105803-1-rhys@tumelty.co.uk>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260610173026.1105803-1-rhys@tumelty.co.uk>
X-Spamd-Bar: ----
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NACOK22BM4CUYGXRIYH27SJMRNQHYSPB
X-Message-ID-Hash: NACOK22BM4CUYGXRIYH27SJMRNQHYSPB
X-Mailman-Approved-At: Thu, 11 Jun 2026 14:41:10 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unused macro CAP_TIMEOUT_MS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NACOK22BM4CUYGXRIYH27SJMRNQHYSPB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ieee.org : SPF not aligned (relaxed),reject,sampled_out];
	R_DKIM_REJECT(1.00)[ieee.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rhys@tumelty.co.uk,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@ieee.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ieee.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@ieee.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,tumelty.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E8B6672C8A

On 6/10/26 12:30 PM, Rhys Tumelty wrote:
> The macro CAP_TIMEOUT_MS is defined but never used anywhere
> in the kernel tree. Remove it to clean up code.
> 
> Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/authentication.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
> index 97b9937bbdc1..d8f2cd43201f 100644
> --- a/drivers/staging/greybus/authentication.c
> +++ b/drivers/staging/greybus/authentication.c
> @@ -15,8 +15,6 @@
>   #include "greybus_authentication.h"
>   #include "firmware.h"
>   
> -#define CAP_TIMEOUT_MS		1000
> -
>   /*
>    * Number of minor devices this driver supports.
>    * There will be exactly one required per Interface.

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
