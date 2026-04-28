Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDbuMUO78Wl1kAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:03:15 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F4218490E96
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:03:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 26D7E404A5
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 08:03:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	by lists.linaro.org (Postfix) with ESMTPS id 9B3243F952
	for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 09:14:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ICrlrm/b";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.51 as permitted sender) smtp.mailfrom=error27@gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so135118505e9.0
        for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367693; x=1777972493; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qNOsPKOzldEqNG1+DveJbYY2Z5WlvWIU1aJujOgzo5U=;
        b=ICrlrm/bDMX25LP1nsbPrxiNwoLeJnmLj2y1XaQmg4Ic0gfMwi0k9uEUOYf49Qkkbj
         AcG0/Fa28lvaCXOzS3HoowYAP3A1W2JUJx0YGzQ8eFMOU/6fF4zBhwmPiQGs9z5RmRpB
         99TCOcxt/Ke6q29ll815608trFIqPMGOaDu78uq3OL93s1LPAqLdaByBBaOtRVjGxIkE
         dO4T3T6bFx9T2u6Ul7/p6nr9qpGgV+zpHxHBYXRnC+LqyHyegg6+M4Ko32C7D1cyglrC
         k7Pbf4ANDa8HLiKQa/5yJncqdCwiN9pTX460cMX1tuhcdCpT29keyL9KPKL2CgUnql0y
         os5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367693; x=1777972493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNOsPKOzldEqNG1+DveJbYY2Z5WlvWIU1aJujOgzo5U=;
        b=LGHOjQS0pXb/xnQeJWmMVpLE0Pbt/A3rfqMaLSCDEs059MIMIsXPK8E0+V7FKUOCGb
         gzpJhWydCGEnmNtoIEjCQzVsByEmsL8LDaIDJ1xkf+fnMMEv0XEla+JsHWMlzChL3CEO
         IYc+gv9gqHkdP9TnrbjoiYZqPLD/5AEei2BbkQZUGcf5HeMGv0YyA23jOVGutRqM4bEz
         vdIU3wTeAMXiDi49E2tbdbYy4YZYGxr0SAjsj0hfw036Mvm8iLzv8xZZbZDi0Fu9oF9v
         PV2CUZhhv7ww9Fpoj1BcmbDKVV9DRo/87Qwonv3u80HJDkE82u4rFYUG6ZtX3p3Kxbr1
         YYPA==
X-Forwarded-Encrypted: i=1; AFNElJ+zfGqX+/Lr7PY08FLuKdl3oNMwsS/UktVY3PqiX+lTh5q0GLm4WytRQN839MsxZsFDoir9/63SPWde3Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YzaiSOveLHfkdE02uxRZ8x/SVzuvN8eG1rl4Ad13wLZd1IDSR+v
	ZGW/bRLqn1f4kOvPaAbEVs/4/wvpocvrepHSBxYcmcjILAopAAYzGAzn
X-Gm-Gg: AeBDievXF4+u2wqtJifSjEz/t4IVDjAi5Vr13V0jSc3FWrnimg2/DurlJAXk1vSDuQe
	4IXYAdThynGqnEPCfBW7HBj2KrRjTSt/kA8UhMT4s7XKKugfbdmuW2cu2LMTCILIMYEl6oHqEGS
	sW72k95YuU/3kEdfVDQwZefiSEsIscrc+SD++8IjFQoFNXVsDYHXdPljFPyqq59ghS3OldPhLUt
	wxrELl0IsryrvBE8oA48z2YKxQ4Fa2i+c61r9NFiHqedSEy2J941Ch3h4bgPf5YlaZW1p8SlE3w
	JgRfGjswNr4zmhL/7+28F9oUX0QcmthQQHCn4In9afbMqNznEDrqD3VkQ6KdgQjam0OS1mX7RPw
	RuvTeYKcR7OA635QpARPfI7PaWr6JLqgZiia4ylxEn257k3J3vIxo5JpkVR99zXi0OQ2wbVy6Jj
	S69+rOo27j2avDrP0zYIhfKSpVoq4YyA==
X-Received: by 2002:a5d:5f51:0:b0:441:1df5:480c with SMTP id ffacd0b85a97d-4464a070032mr4187168f8f.42.1777367693356;
        Tue, 28 Apr 2026 02:14:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59e5asm5190266f8f.5.2026.04.28.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:14:52 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:14:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: kernelcoredev <sonionwhat@gmail.com>
Message-ID: <afB6iSKiEy5V1mNR@stanley.mountain>
References: <20260428002448.4829-1-sonionwhat@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428002448.4829-1-sonionwhat@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QCAYD4DELCC6L2VCU7SHJTQQ2XFZ755N
X-Message-ID-Hash: QCAYD4DELCC6L2VCU7SHJTQQ2XFZ755N
X-Mailman-Approved-At: Wed, 29 Apr 2026 08:01:57 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QCAYD4DELCC6L2VCU7SHJTQQ2XFZ755N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F4218490E96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.955];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]

On Mon, Apr 27, 2026 at 08:24:48PM -0400, kernelcoredev wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.

Put this meta commentary

> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
> ---
  ^^^
Under the --- cut off line.

>  drivers/staging/greybus/bootrom.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c..757460c8b 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -168,12 +168,9 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
>  		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>  		 intf->vendor_id, intf->product_id);
>  
> -	// FIXME:
> -	// Turn to dev_dbg later after everyone has valid bootloaders with good
> -	// ids, but leave this as dev_info for now to make it easier to track
> -	// down "empty" vid/pid modules.
> -	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
> -		 firmware_name);
> +
> +    dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
> +	    firmware_name);

Please run your patches through checkpatch.pl.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

>  
>  	rc = request_firmware(&bootrom->fw, firmware_name,
>  			      &connection->bundle->dev);
> -- 
> 2.54.0
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
