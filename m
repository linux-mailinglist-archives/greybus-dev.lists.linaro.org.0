Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xzVSAX/fL2oyIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:23 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id A3708685AB6
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:18:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=kzt8jHKS;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9328740A78
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:18:21 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	by lists.linaro.org (Postfix) with ESMTPS id 089C3401BA
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 07:35:08 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8cebfb15413so33553426d6.0
        for <greybus-dev@lists.linaro.org>; Mon, 15 Jun 2026 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508907; x=1782113707; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVJ2SgZJKrM5Glp+hNfPWwv4XWSIB/g6FTAAAMIWkoE=;
        b=kzt8jHKSLfqh28BCNzaN8JsDH1Jtz2esmzjWzIByjl0Y1r+J6ofkV3RccCNOcI7z4Y
         uNO1peoHbO2XCOXJII9eAPin/t9/87uhPhSl9UrW8VQJBiXfvbAPcUCbZelEu6z6MHY7
         GTgS4M5gvg9QLeCDOXhi2ZEjgICq9zEHgeZUnsJaxKF8FVg27Ejb8kkI0Bpf3cOmwj81
         EOXDzbo8WAQuXkM5JwwdceCHyQcWk4gW/TB7rF+ZfdtT2XO1+JHtkNCOu/TzmUrXV8pv
         1NSdJ0TP6Z5qGllHfUN0UBk8H5SZSuJBTTGa3KPcnfdromVnEqNmrQeSVs5ndbNwqQna
         vT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508907; x=1782113707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVJ2SgZJKrM5Glp+hNfPWwv4XWSIB/g6FTAAAMIWkoE=;
        b=ibef1K/zz5W+RgbR/Ey6NQu079boxzg+DW7stsTKxdZIdDpPnb8cu/SH4n1m2SOwef
         /XEduNpJmamZM/mo+buxbmfqnKGj2iJFvL//abNL6iMX16Qu1cMkS0uCJl2gHal+4Mc9
         9IhZnHGc80JimYxwR4bsFj8qE1M7fY3X6xACcjz9NTliGbe3S9ESbYz74xWs9M4Msv7J
         YmwgfunmZhvomUONPZ/bgG43Yyr7a2+Ti9XOgcWURhQQXVojOw6D7UHxdm69zDSwnncO
         7Xkgx2JbxBJPKq6IGliriavZldcaS9AoL5Hf5Hy8uMc0A5x8A/5si0hYNEwI8MLr+1he
         iSBg==
X-Forwarded-Encrypted: i=1; AFNElJ/K0Ngpu6QuFC/q4aswQTomc5sPsLtE/0r3/F9+8YENdG9jmgZJaL4Ss1X/lUzFgFyKStSZxBdYH3KCWA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwLE9wMm8mA34wIOGJzr4IMAQlNwuA+X3lJvoXufvaiGZCGePed
	QXgrSHzm+hV3ZY6ZCY409YELpO5zxF9WiEHVs2SM4K1sDjvZ8wVvyN9W
X-Gm-Gg: Acq92OH8FLGrh4bN7JaSLBa2jtSE2I6YCO2j5sG++WXakIILSwiZvKqbyfC0koc1l/l
	Z0B4yQWUB3262SD52K6uAhxJoPP/vM3gLGIGaR+3/SMTa/o6tW4ZIHnv+ez74WTFriRtCzHToBB
	ZwQd9DMOy+V/PAD2+Nru7eREmcJaSHCLHVp3YqwmD3BAGiPcpDR0QXjAeJCVxdmSTa683TRPIVk
	mFNI2Z0EjJVmTh1DGGZfJmhWA4Nxnd/pc8H1mssPuBDLOA+wEUB2l8RXhyRJi40GHuRkC1CYtgg
	o9VIpugap9lNGn5m7waj8UT6Gf+5ZlQprccXgyZlN4/x421DfBQigZwCtnCTAHIPKJNTlAveWvV
	OEnYGyTyau+TW+QDXE9el0hr0Tm2oOftUhDLTTaXDBiQLbAFF3e8xLq3QcpOuFfdrQA4L0/azVv
	CiloznJvtmP14Wargg
X-Received: by 2002:a05:6214:2522:b0:8ce:ee76:1597 with SMTP id 6a1803df08f44-8d44fce0ffamr168956306d6.43.1781508907477;
        Mon, 15 Jun 2026 00:35:07 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fd9csm108145536d6.10.2026.06.15.00.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:35:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:35:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Message-ID: <ai-rJPFgXHrJ1IEE@stanley.mountain>
References: <20260614154329.5176-1-abdelnasserhussein11@gmail.com>
 <20260614154329.5176-2-abdelnasserhussein11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614154329.5176-2-abdelnasserhussein11@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MFDFJNEEVVX6KM3L67MK4UIHYYAAJPSU
X-Message-ID-Hash: MFDFJNEEVVX6KM3L67MK4UIHYYAAJPSU
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:49 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 1/2] staging: greybus: audio_codec: fix sscanf return value check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MFDFJNEEVVX6KM3L67MK4UIHYYAAJPSU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abdelnasserhussein11@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:dan.carpenter@oracle.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3708685AB6

On Sun, Jun 14, 2026 at 06:43:28PM +0300, Abdelnasser Hussein wrote:
> Smatch static checker warns:
> drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
> warn: sscanf doesn't return error codes
> 
> The sscanf() function returns the number of successfully matched input
> items, not a negative error code. Compare the return value directly
> with the expected number of conversions (3) instead of storing it in
> 'ret' and returning it as an error code, which leads to returning
> a positive value on failure.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Closes: https://lore.kernel.org/all/YoOLnDkHgVltyXK7@kili/
> 
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>

There shouldn't be a blank line in the middle of the tags
block.

The closes tag isn't right...
https://lore.kernel.org/all/202103080429.X31wogmF-lkp@intel.com/
Sorry, this stuff is a bit confusing to everyone who is not involved
with the zero day bot.  What happens is that for some warnings, they
first send the warning to me and I look it over and decide whether or
not it's valid.  In this case, I decided it wasn't valid.  Sure, I can
understand why the static checker thinks we're propagating the return
from sscanf() but actually the second else if is always true.

(I haven't actually checked that btw, I'm just assuming that the
second else if is always true.  Static analysis is always a best
effort type of thing).

regards,
dan carpenter


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
