Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P0dnLR89PWq1zwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:19 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C2A6C6B73
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="W+/+QIFh";
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AC2E140AF5
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:18 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	by lists.linaro.org (Postfix) with ESMTPS id 7DFD03F99D
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 10:27:36 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6a133f81346so173928eaf.1
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782383256; x=1782988056; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WKFN+bw8sY7v3WiWOtoFku5fUwcwrZGxnyX6mydsFI=;
        b=W+/+QIFhaNfsfXN2aiGO7PEb8VVc2T6Qtza8z5wMX5YfMElcfF6YoJHYukAaswWYw0
         6B3bUFbcIZx7TrtYDJFFfFhCMS3Mci1c+JqXZIVH0zBADEUGcCLtxKJ8s3j+cIQwbIYb
         RjPmWKPFBPmMvVzJXzMxOi71p8Ul7x6Uj4CceDeAtrgiB0IY6kYvfGnBxeuqxPmx9JuK
         2D4rU+cd9XeelvIMxDygOS4tIWVixYSlMhzO3Y1p+Ffvvu3u1HthPyvQUzBbGPaJu1rX
         Wa1At7iDPtgfhRcnCpWp6gEP+/4rLRpw+ly25OhVBnQSUp4EmoRovJh2sVnt6KX9Dsb6
         GAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383256; x=1782988056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WKFN+bw8sY7v3WiWOtoFku5fUwcwrZGxnyX6mydsFI=;
        b=Lg40115Z6G++t2dsidYZZPyjBagqdEIHn4P/C+PQnxYBLgXZf1pR+Qy+Q9a5xuXtWa
         niZfPr0QAmKv19DTyYh3itBwujoadufu+Y9WE3JvMwbDkzcvZ7ONIvL/Lfrju52OO9C4
         JlQ+NK2djYBXsRdhJ86qSj5Xf2FF2X7WhNqms98U1ZPMOmHPmxaHVCMbC22MK6J9LAWM
         fxa6lD1EWyPsndSwIC5eHydGrN0HSZYzVyYys8MOyXBjb6Am6I2vu215wmHC7kQTi1Zv
         i8dTNR/avwwUgDeJaWoWThZuMiMDIRYAz1TbNBNuSFht3ES9Scz3tr9bPuqjP4q3kyL2
         wtCg==
X-Forwarded-Encrypted: i=1; AFNElJ97hnGRPzB1KZG+aazwknxu3GTIExUOw6xFgbJEzTZ4QpDju3wXlmjZc/NpFvU7441SlHviK7sR01WZ5w==@lists.linaro.org
X-Gm-Message-State: AOJu0YyeWlZT1h91GtXWJEpR6bHWAI7WQr2TKZM+swlAGu6EgIXu2VOC
	AOUTZ3QbJb2hwaftJzKHEZNSGaFX+vP10ppJiG+GVhfvD40FdzjUKx/9
X-Gm-Gg: AfdE7cn37bZkbgZuNnNysLnBqg+aMNhjMYMmRPeX9C3BLLevfOBHhBl2lROZvGqw6vJ
	yRQsi+mTuoL2Ngadq5VJoDUxR/3kJ5Ezdkq8DTtHfulcnfTxd09ZEWy8N8hh7+kFDm3/b8fA1WP
	/uZXKIYhjCmSDL+VR6ps41kiIpVg1tQeeegGW0xOiveVrtCNuT2dOC4PP2yopexG1nx3rBqO0K7
	F40SulVVJ0Y1VEWVMpsPKQ9w2fNqtYCwpAZ+kzJY5ELsdz8Y8dFLBr4CvLWxqfBw5idVrQjZyaF
	iiYciHahSfFOoEQZNDNWHrK2JRX6ceYnjjfSwI+RjH1Be7lH0CeDzE122WelceZACvNfK8MiVn9
	q1pSj8equW/oxs/nlhJB+ijLUHkJInhsZDwVRMjxriqwnnXqBu0Ha5lk4+JzJdE8fXQKM/3+vZd
	MPYP9E
X-Received: by 2002:a4a:e917:0:b0:69d:4f94:cf2a with SMTP id 006d021491bc7-6a135266f27mr1216037eaf.56.1782383255823;
        Thu, 25 Jun 2026 03:27:35 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0ea102694sm10136790eaf.13.2026.06.25.03.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:27:34 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:27:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: suryasaimadhu <suryasaimadhu369@gmail.com>
Message-ID: <aj0CjyGElhXxS3eK@stanley.mountain>
References: <20260625091416.230920-1-suryasaimadhu369@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625091416.230920-1-suryasaimadhu369@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HYOYDH3ZM46BYOOW5YMS7BF2GZI7WEUE
X-Message-ID-Hash: HYOYDH3ZM46BYOOW5YMS7BF2GZI7WEUE
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:00 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add missing newlines in sysfs_emit calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HYOYDH3ZM46BYOOW5YMS7BF2GZI7WEUE/>
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:suryasaimadhu369@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,stanley.mountain:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88C2A6C6B73

On Thu, Jun 25, 2026 at 05:14:16PM +0800, suryasaimadhu wrote:
> Add missing terminating newlines to sysfs_emit format strings
> in audio_manager_module.c as required by sysfs ABI.
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> ---

This changes the user space API so it's a bit risky.  Only make this
sort of change for new code.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
