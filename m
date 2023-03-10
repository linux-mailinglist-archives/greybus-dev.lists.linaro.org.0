Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E99786B5575
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 021BF3F4EC
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	by lists.linaro.org (Postfix) with ESMTPS id 587723F4C9
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 19:40:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=Af7JO7Hx;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.128.47 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso6876489wmi.4
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 11:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678477235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIVM9gDEt50e3uY9K91rrf6A4MD0eVPqdDEqNDoPjx0=;
        b=Af7JO7HxSOsGysQU2nQpndk//csoYcKGBL4rZwe2nN407kJAQPmjKfXEFVRhXMEVNZ
         ikk5tm3pAxtPM2b0fQFjy7Cio6kRgg620dAkNUa+zbgAgP/U4Np0VSLP5obKSYj28w6Z
         Rlq3qqrIZFsiNbuZzjQFJFVuaIeSMMFVho++ESu8t02hi9IhbmcEo85kvl8ngm/p7ccI
         wzIr//rPJb6Hnys6s6/TLrTxjF8exKUkOB4NQrGMAfbipv1vOCVI91eEi7SAh/YSRwic
         DsyBBT0D/8vR0Yt0zd6yTtBmKPAAwbWxI7nJY9jH/qiauQQv885WXlEPACEmxWnqmSGN
         41gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIVM9gDEt50e3uY9K91rrf6A4MD0eVPqdDEqNDoPjx0=;
        b=q1CLNh9gpk0rYHQtTGnTzomjIvnNyodO1Sru8NqZRJ/Ulyyer+tkOVOytARF36KbGH
         0wfQfoA0HKPEhtwizHih6sD4My18KRXuYPhjHRGs28VeR/YyQm0U/PvQ/crF6z+OVSEb
         BZizvBC4iAJvIKzckC6MFVPcSZLjxAtDGGk2RcDHc/vIj2sGg+NhPur2/IRZZ9sIyU2X
         YO3jqaOjt+qykkAv6DBRcIhqFlCAPZNhyWWrJPI7zbsgknzFFWfskr8KCSRVKPi1gnmJ
         ms4AeF89Ck2ac9W/ZE6zlI23E8OmHVcQoVj6FveQRId6GcUPczhGFFn3x+9YVnnJZ1bq
         lmVg==
X-Gm-Message-State: AO0yUKXL8nTp1tLtmY8aTohxMohS9dSb7TPuwSsSfDV2fB2Prfb3FOuh
	3ATVSx9MeABTJjemKfQ+yNo=
X-Google-Smtp-Source: AK7set9066pNFYOHzB+Q22vNE9iBk4JmLORV4Yc2gkxfEkMoebK5w//tiGEoY8OZ+zx+nNOcp+LjGw==
X-Received: by 2002:a05:600c:154a:b0:3e7:95ba:e1c7 with SMTP id f10-20020a05600c154a00b003e795bae1c7mr3836812wmg.32.1678477235162;
        Fri, 10 Mar 2023 11:40:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m16-20020a7bce10000000b003eaee9e0d22sm718524wmc.33.2023.03.10.11.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:40:34 -0800 (PST)
Date: Fri, 10 Mar 2023 22:40:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <eb7475da-7548-4820-a2b6-ff0f6cf4be71@kili.mountain>
References: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 587723F4C9
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.47:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: G22NIMHGCEQFR57Z543Z3BWAIQZ623ZG
X-Message-ID-Hash: G22NIMHGCEQFR57Z543Z3BWAIQZ623ZG
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:52 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G22NIMHGCEQFR57Z543Z3BWAIQZ623ZG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 10, 2023 at 10:09:47PM +0500, Khadija Kamran wrote:
> Length of line 182 exceeds 100 columns in file
> drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
> line.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index fcbd5f71eff2..0f0fbc263f8a 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,7 +179,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
>  					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +						WD_STATE_COLDBOOT_TRIG);

The original line was done deliberately so that it lines up.  If we
apply your patch and re-run checkpatch -f on the file then it has a new
warning:

CHECK: Alignment should match open parenthesis
#182: FILE: drivers/staging/greybus/arche-platform.c:182:
+                                       arche_platform_set_wake_detect_state(arche_pdata,
+                                               WD_STATE_COLDBOOT_TRIG);

Always try to think about the bigger picture.  Why did the original
author do it that way?  The change makes checkpatch happy, but does it
make the code more readable?  Is there a more important readability
improvement to be done here?

For example, you could re-arrange the if statements like this and pull
everything in a few tabs.  Don't necessarily do that.  Just think about
doing it.  I write quite a few cleanup patches that I don't send because
the next day I just decide it's not worth it.

When I look at this file, the style is not bad at all.  But at the start
of the file there is #if IS_ENABLED(CONFIG_USB_HSIC_USB3613).  What is
that?  The CONFIG doesn't exist and the header doesn't exits.  Probably
it can be deleted.

But that raises a new question.  Lukas Bulwahn is always looking for
CONFIG_ entries which don't exist.  I would have expected him to find
this already.

Anyway, we can write our own scripts to make a list of stuff inside
IS_ENABLED():

git grep IS_ENABLED | \
	perl -ne 'if (/IS_ENABLED\((.+?)\)/){ print "$1\n"}' | \
	sort -u | tee CONFIG_list

Then we can go through the CONFIG_list file and see which other stuff
doesn't exist.

for i in $(grep ^CONFIG CONFIG_list  | cut -d '_' -f 2-) ; do \
	grep -q -w "config $i$" $(find -name Kconfig) || echo $i ; \
done | tee CONFIG_not_found

I have never done this before so I don't know what you'll find.  But
everywhere you look if you just look closer then it raises questions
which raise more questions.  So it's interesting to explore.  Anyway,
look closely at each line in the file and follow the rabbit holes until
you find something interesting to work on.

regards,
dan carpenter

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..2d9e0c41b5e3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -165,43 +165,39 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 		 * 30msec, then standby boot sequence is initiated, which is not
 		 * supported/implemented as of now. So ignore it.
 		 */
-		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
-			if (time_before(jiffies,
-					arche_pdata->wake_detect_start +
-					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
-				arche_platform_set_wake_detect_state(arche_pdata,
-								     WD_STATE_IDLE);
-			} else {
-				/*
-				 * Check we are not in middle of irq thread
-				 * already
-				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
-					return IRQ_WAKE_THREAD;
-				}
-			}
-		}
-	} else {
-		/* wake/detect falling */
-		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
-			arche_pdata->wake_detect_start = jiffies;
+		if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
+			goto out_unlock;
+
+		if (time_before(jiffies,
+				arche_pdata->wake_detect_start +
+				msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
+			arche_platform_set_wake_detect_state(arche_pdata,
+							     WD_STATE_IDLE);
+		} else if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
 			/*
-			 * In the beginning, when wake/detect goes low
-			 * (first time), we assume it is meant for coldboot
-			 * and set the flag. If wake/detect line stays low
-			 * beyond 30msec, then it is coldboot else fallback
-			 * to standby boot.
+			 * Check we are not in middle of irq thread
+			 * already
 			 */
 			arche_platform_set_wake_detect_state(arche_pdata,
-							     WD_STATE_BOOT_INIT);
+							     WD_STATE_COLDBOOT_TRIG);
+			spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
+			return IRQ_WAKE_THREAD;
 		}
+	} else if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
+		/* wake/detect falling */
+		arche_pdata->wake_detect_start = jiffies;
+		/*
+		 * In the beginning, when wake/detect goes low
+		 * (first time), we assume it is meant for coldboot
+		 * and set the flag. If wake/detect line stays low
+		 * beyond 30msec, then it is coldboot else fallback
+		 * to standby boot.
+		 */
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_BOOT_INIT);
 	}
 
+out_unlock:
 	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 
 	return IRQ_HANDLED;
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
