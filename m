Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B6D6D43A0
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 05F123F958
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 22A733EE32
	for <greybus-dev@lists.linaro.org>; Sat,  1 Apr 2023 17:42:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="iZ/0wIrv";
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.128.46 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id p34so14728563wms.3
        for <greybus-dev@lists.linaro.org>; Sat, 01 Apr 2023 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680370921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=merQPvph7q/x0aOQVRyhO3lhqdf/YVeXNljQsqoNaGE=;
        b=iZ/0wIrvRaQE+pW0fOMWY8n4BHZXr3w94OZk29xHka93TM8zs2r9QYKR9PdypbN5qZ
         CsqLeQp9OsjGuyLkOQQhRyECOaU4x6gWu1eYfccBv0YapvVl2JaYL468EC9DieToFnCx
         GAdL86atXpyFRJmJ42i9oiYjjqCmsKmZAssrE2OjU0T6O3yuo8bgAgyNtT1/6Fp3GnSI
         uS1oshFIvtTl9C+sXrPz4+ioqFMHGZKr3Ogp8ki7KU+/ZChCLqwDzpKdbcS77nN8MMQk
         D7gXccjvDpdfV7F2QS1jh+NDqdFG7Dz1QuV8Dnu+MCiCdLcnyIcts17f9bekmb4zrmzH
         DURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680370921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=merQPvph7q/x0aOQVRyhO3lhqdf/YVeXNljQsqoNaGE=;
        b=rarRNOxHhDIpWukhbJxXOo1nyG6xz5lxc2+QRIfwq2bhVVgSioVw4z2JlNFTi5lRFv
         e9LdAJK8HifE7UGhWW9CtUCbrIr+P8rMr/e7RvmNm2UfMtDu0ffgdU1nli74FNeBF0Nc
         Ob+0Xoo5tDY71g/Vysl8vRmK3e5k5416O0d2maIvp2hdXWzndlBJkXEnCZsY+905w6Vo
         4V3UjgCOH7irH2KujL4DOpOmEW0Vg9hSsqudJPFVqGq/3XcSVphwDWVSulPnx2MYd6q5
         kH/wP7xOJZnptQpP0jvAnuYIBv2AzfkTc/3L9XJJXnaWhKOA1Lhgszcn39Ry2qVfeSKs
         s51A==
X-Gm-Message-State: AO0yUKUIsCUFhHhGZf5nbRMV/FnCeVrmHJxws2e8pQvkQ7Jz057QIPqF
	TidBQlcri2ph2ibnq8Va8I0=
X-Google-Smtp-Source: AK7set9gbqxU+g3zXQ8niV5jxCprtZqMtFtF+kWWCEH+NTnuB7UVU8Zomtsfk89ArKgHnEiXFy6Wtg==
X-Received: by 2002:a05:600c:20f:b0:3eb:5ab3:b6d0 with SMTP id 15-20020a05600c020f00b003eb5ab3b6d0mr22258209wmi.6.1680370920878;
        Sat, 01 Apr 2023 10:42:00 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003edff838723sm6703814wml.3.2023.04.01.10.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 10:42:00 -0700 (PDT)
Date: Sat, 1 Apr 2023 22:41:58 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Message-ID: <ZChs5jB7DMCUnVzr@khadija-virtual-machine>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
 <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 22A733EE32
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[39.41.14.14:received];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.46:from];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FXBVBXPC4LWS6LKBZKH26U3APIXOWBQD
X-Message-ID-Hash: FXBVBXPC4LWS6LKBZKH26U3APIXOWBQD
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FXBVBXPC4LWS6LKBZKH26U3APIXOWBQD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 30, 2023 at 06:23:19PM +0300, Dan Carpenter wrote:
> On Thu, Mar 30, 2023 at 07:11:25PM +0500, Khadija Kamran wrote:
> > Linux kernel coding-style suggests to fix your program if it needs more
> > than 3 levels of indentation. Due to indentation, line length also
> > exceeds 100 columns, resulting in issues reported by checkpatch.
> > 
> > Refactor the arche_platform_wd_irq() function and reduce the indentation
> > with the help of goto statement.
> > 
> > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
> >  1 file changed, 41 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index a64c1af091b0..dde30c8da1a1 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  
> >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> >  
> > -	if (gpiod_get_value(arche_pdata->wake_detect)) {
> > -		/* wake/detect rising */
> > +	if (!gpiod_get_value(arche_pdata->wake_detect))
> > +		goto falling;
> >  
> > +	/* wake/detect rising */
> > +
> > +	/*
> > +	 * If wake/detect line goes high after low, within less than
> > +	 * 30msec, then standby boot sequence is initiated, which is not
> > +	 * supported/implemented as of now. So ignore it.
> > +	 */
> > +	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
> > +		goto out;
> 
> This checks that we are in WD_STATE_BOOT_INIT state.
> 
> > +
> > +	if (time_before(jiffies,
> > +			arche_pdata->wake_detect_start +
> > +			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > +		arche_platform_set_wake_detect_state(arche_pdata,
> > +						     WD_STATE_IDLE);
> > +		got out;
> > +	}
> > +
> > +	/* Check we are not in middle of irq thread already */
> > +	if (arche_pdata->wake_detect_state !=
> > +			WD_STATE_COLDBOOT_START) {
> 
> This checks that we are not in WD_STATE_COLDBOOT_START state.  How are
> we going to be in COLDBOOT if we are in INIT?  Is this changing in the
> background?  Can this check be removed?  This might be took tricky to
> answer but it's important that we understand this before we continue.
> 
> 
> > +		arche_platform_set_wake_detect_state(arche_pdata,
> > +						     WD_STATE_COLDBOOT_TRIG);
> > +		rc = IRQ_WAKE_THREAD;
> > +		goto out;
> > +	}
> 
> Let's assume the above check cannot be removed.
> 
> In the original code if gpiod_get_value(arche_pdata->wake_detect)
> returned true and arche_pdata->wake_detect_state == WD_STATE_IDLE then
> it just returned without doing anything, but now we fall through to the
> falling: label below.

Hey Dan,

Just to clear my undrstanding in the new code, if
gpiod_get_value(arche_pdata->wake_detect) returned true, we go to the
rising section. In the rising section if arche_pdata->wake_detect_state
== WD_STATE_IDLE then the condition,
if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT) becomes true
so we goto out label. I do not understand how we go to falling label.

Regards,
Khadija

> So this patch seems like it introduces a bug, but actually it might just
> have a dead code problem.
> 
> regards,
> dan carpenter
> 
> > +
> > +falling:
> > +	/* wake/detect falling */
> > +	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> > +		arche_pdata->wake_detect_start = jiffies;
> >  		/*
> > -		 * If wake/detect line goes high after low, within less than
> > -		 * 30msec, then standby boot sequence is initiated, which is not
> > -		 * supported/implemented as of now. So ignore it.
> > +		 * In the beginning, when wake/detect goes low
> > +		 * (first time), we assume it is meant for coldboot
> > +		 * and set the flag. If wake/detect line stays low
> > +		 * beyond 30msec, then it is coldboot else fallback
> > +		 * to standby boot.
> >  		 */
> > -		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
> > -			if (time_before(jiffies,
> > -					arche_pdata->wake_detect_start +
> > -					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
> > -				arche_platform_set_wake_detect_state(arche_pdata,
> > -								     WD_STATE_IDLE);
> > -			} else {
> > -				/*
> > -				 * Check we are not in middle of irq thread
> > -				 * already
> > -				 */
> > -				if (arche_pdata->wake_detect_state !=
> > -						WD_STATE_COLDBOOT_START) {
> > -					arche_platform_set_wake_detect_state(arche_pdata,
> > -									     WD_STATE_COLDBOOT_TRIG);
> > -					rc = IRQ_WAKE_THREAD;
> > -				}
> > -			}
> > -		}
> > -	} else {
> > -		/* wake/detect falling */
> > -		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
> > -			arche_pdata->wake_detect_start = jiffies;
> > -			/*
> > -			 * In the beginning, when wake/detect goes low
> > -			 * (first time), we assume it is meant for coldboot
> > -			 * and set the flag. If wake/detect line stays low
> > -			 * beyond 30msec, then it is coldboot else fallback
> > -			 * to standby boot.
> > -			 */
> > -			arche_platform_set_wake_detect_state(arche_pdata,
> > -							     WD_STATE_BOOT_INIT);
> > -		}
> > +		arche_platform_set_wake_detect_state(arche_pdata,
> > +						     WD_STATE_BOOT_INIT);
> >  	}
> >  
> > +out:
> >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> >  
> >  	return rc;
> > -- 
> > 2.34.1
> > 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
