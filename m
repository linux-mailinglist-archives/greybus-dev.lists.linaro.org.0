Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD46D5041
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 20:25:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 149DC3F0B6
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 18:25:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	by lists.linaro.org (Postfix) with ESMTPS id 5F7DA3ED16
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 15:23:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="G/Pda6VD";
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.45 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id e18so29744220wra.9
        for <greybus-dev@lists.linaro.org>; Mon, 03 Apr 2023 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680535387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aTzkLYbvfd2IjRZTFEqIenxLEq+ZjYmO48DPd7DLZEY=;
        b=G/Pda6VDK6CxGQSeSiPCjP+S24TJAX3Dk5+qGro8GNMocnUHuA1ITVKwywe21C5HZ7
         BESY7KJmZeWGxvOiIkcexgYYe30hSBzTlwgAN8o1/RAw0tLS5N7FLOirAFLszZcqLGl1
         CwuiLVeC+RO+KLy33iEYBdVr+oDSxoxm0vh+f219Xp1IcVHRFeC3XocRX5h/gDSYIjtI
         b2EF8E1pP7XBplWfwKAwhI+4YALVOxcVL4siHkV/ujRLQwvYLbawMIDMnrXM0MRDjWJh
         rrvkgHAWGLTfKWyV/ZR9fPL9645FfkiJlty1QZ3DTHj9KOj7DWAUvHXE6sJ5LwLxFT8Z
         BPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTzkLYbvfd2IjRZTFEqIenxLEq+ZjYmO48DPd7DLZEY=;
        b=w2d1RilTYyYzftus0hUJbvhrOTzCYnrOs1w6mtexgK/CJD2F3DOluSxtQ4KcxJ3Vbt
         tUkz7V0mh8u/xYroIHWt8pTjoRST9YmZIj5yb6bj+43h/4dXmI+fahnATtDEQizBl0wI
         muea1pAplnnB5oBZlbxexDBQWJh7gCpNWgZxogu2ujXjipu5k6eoUhsq1eI5vOw5Xs5S
         0ukliXfvMVQlDt7oazDglJiUyjOqaMfw8jc990oYU4R2JNV3UvkHCU7cLzchK+6af5mJ
         nHMhYSw5pREXbYYaT7MSbS0aiKqPVDY1FBUKwQL2NNMZk0keHiFCH6sLeNrWmTiL12Hp
         S8bQ==
X-Gm-Message-State: AAQBX9em/bpq876ILuoOiVddA7CdMwqgarUKN+xtPG/tSgLbaCqZCa+9
	NgKJKNL2xylB9adgSMuXayk=
X-Google-Smtp-Source: AKy350bqYjtBj10U3WWxA1pDD+RJFNIqqC8vJ90OuKimssYnRw8/Viy514sQo53q4o6IlyeMdTEtfQ==
X-Received: by 2002:adf:fccc:0:b0:2cf:e868:f789 with SMTP id f12-20020adffccc000000b002cfe868f789mr26500082wrs.48.1680535387234;
        Mon, 03 Apr 2023 08:23:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d6386000000b002e558f1c45fsm9870405wru.69.2023.04.03.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 08:23:06 -0700 (PDT)
Date: Mon, 3 Apr 2023 18:23:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Message-ID: <02031cc0-c035-4171-89d2-6e53a5c3d6d8@kili.mountain>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
 <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
 <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9688d93f-5ece-4799-898d-98515a98f9be@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5F7DA3ED16
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.00 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.45:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5AHSP7NNK3JMHGX5VSAWMSHMZ75RBJS5
X-Message-ID-Hash: 5AHSP7NNK3JMHGX5VSAWMSHMZ75RBJS5
X-Mailman-Approved-At: Mon, 03 Apr 2023 18:25:48 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5AHSP7NNK3JMHGX5VSAWMSHMZ75RBJS5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 07:29:36AM +0300, Dan Carpenter wrote:
> > > This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> > > we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> > > background?  Can this check be removed?

It turned out the answer was yes, it can be removed.

> Also if stuff is changing in the background and there is no way the
> locking is correct.

The locking is correct.  Take a look at it.

We are holding the &arche_pdata->wake_lock in arche_platform_wd_irq()
and every place that calls arche_platform_set_wake_detect_state() takes
that lock first.  So it can't change in the background.

Delete the check like so.

regards,
dan carpenter

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..4cca45ee70b3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -172,18 +172,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				arche_platform_set_wake_detect_state(arche_pdata,
 								     WD_STATE_IDLE);
 			} else {
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
+				arche_platform_set_wake_detect_state(arche_pdata,
+								     WD_STATE_COLDBOOT_TRIG);
+				spin_unlock_irqrestore(&arche_pdata->wake_lock,
+						       flags);
+				return IRQ_WAKE_THREAD;
 			}
 		}
 	} else {
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
