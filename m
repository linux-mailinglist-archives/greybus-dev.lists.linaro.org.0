Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE156D439E
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1DF743ED7B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	by lists.linaro.org (Postfix) with ESMTPS id 471B73E89F
	for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 15:05:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=H3KCxqCf;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.43 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id l27so19432069wrb.2
        for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680188730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHqk1nTzV7ycjwFvCpLIMeUZdQ/ws/pWquuHos3UlIA=;
        b=H3KCxqCfCflzl6WHwZA0TMDFrBJHXqEMMqT0wYP7XswonsCIKoyB5NhweiLlSjr0/8
         7MHImaSCADouon+KDq2VQ6cR0OoDubQ2P4GyBUtXDkieXZMCpsRzIvWpPVkPr1jXKCSn
         6NkjtQCtRkkYmPvGG1oVBc/DBmZ+jjIIsPZZ7YI+G6BngLtwzKftHsYTIjQ2HSay0HEx
         RjSiRArTl4TQ5LY+nkAiqWhvlrDRd9VKRkQiql525/O3GJLXcrKY4bmwkjmb+/4bqV3c
         8QGw4L04ctbEdh9ji4zYUSPBkOdvhxuGOOQPi2S4c9gtmUmymh0h7Pe7JePN38YjIw1I
         4uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680188730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHqk1nTzV7ycjwFvCpLIMeUZdQ/ws/pWquuHos3UlIA=;
        b=HR4l3q+7a3WkbdZGwgdWNk++yhhhRrCcR/K/dRZLYfqmOu5g74dvNSJCaxmwcrHkHp
         RA68jvw2fpcegZb1A3025HrxnKtvNosPLpnqmKZiphO8lmRlIRimA5wQBHFpAjBgmPUr
         y6bfHKzc60c1gv5hJkIZHim7nNUyQLXfD2+AetC5eLOQe8cZle0c4bwyvCBhJkmS7vzG
         5q4TQTbJUEerHmnptDamDgti0jqvGCCd4tvrqr8MyGvxTzXDK8iT0j5uTkqCZBYGaEAd
         ff5+N1DKO1R4CVRDYzvhjk+Kl2FwDth8OsrQnYh5tZqKNlZfWiWQntKG8FQ4oZUMu8um
         G3WQ==
X-Gm-Message-State: AAQBX9c8oVZgAeXF3RV2Bvsh5wBuDpaNi2UCyx3Pm3R2G15vAO/0IOJ6
	wxlvIoGb64Elg75YMUXJ03c=
X-Google-Smtp-Source: AKy350Y8+wmYVIjBkMYJaXy9cmGuAKT6zNtAMxk8kgmxBbAZAy2HIfR+trzIeOaI1D60yObiOTQxTA==
X-Received: by 2002:a5d:4fd0:0:b0:2cc:459b:8bc8 with SMTP id h16-20020a5d4fd0000000b002cc459b8bc8mr18152437wrw.6.1680188730219;
        Thu, 30 Mar 2023 08:05:30 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id k16-20020a5d6d50000000b002cff0e213ddsm33005646wri.14.2023.03.30.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:05:29 -0700 (PDT)
Date: Thu, 30 Mar 2023 20:05:27 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Message-ID: <ZCWlNxAObqge3AB6@khadija-virtual-machine>
References: <ZCH6LV5XU0FBlW7Y@khadija-virtual-machine>
 <a64ad550-9991-4f54-8e09-735133422291@kili.mountain>
 <ZCNygZ8aPsElfTK6@aschofie-mobl2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZCNygZ8aPsElfTK6@aschofie-mobl2>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 471B73E89F
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[39.41.14.14:received,209.85.221.43:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.43:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: D3CHMIXLDJWTYVZYUFE3UJXY2FMCIFSZ
X-Message-ID-Hash: D3CHMIXLDJWTYVZYUFE3UJXY2FMCIFSZ
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: refactor arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D3CHMIXLDJWTYVZYUFE3UJXY2FMCIFSZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 28, 2023 at 04:04:33PM -0700, Alison Schofield wrote:
> On Tue, Mar 28, 2023 at 10:33:23AM +0300, Dan Carpenter wrote:
> > On Tue, Mar 28, 2023 at 01:18:53AM +0500, Khadija Kamran wrote:
> > > Refactor function by adding goto statement. This reduces the
> > > indentation and fixes the issue reported by checkpatch.pl script.
> > > 
> > > "CHECK: line length of 101 exceeds 100 columns"
> > > 
> > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > ---
> > >  drivers/staging/greybus/arche-platform.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > > index fcbd5f71eff2..c7d3b6f7368f 100644
> > > --- a/drivers/staging/greybus/arche-platform.c
> > > +++ b/drivers/staging/greybus/arche-platform.c
> > > @@ -178,11 +178,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > >  				 */
> > >  				if (arche_pdata->wake_detect_state !=
> > >  						WD_STATE_COLDBOOT_START) {
> > > -					arche_platform_set_wake_detect_state(arche_pdata,
> > > -									     WD_STATE_COLDBOOT_TRIG);
> > > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > > -							       flags);
> > > -					return IRQ_WAKE_THREAD;
> > > +					goto out;
> > 
> > I don't like this goto.
> > 
> > It suggests that calling arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> > is a part of a shared exit path when that is not true so it is sort of
> > lying to the reader and making things harder to understand.
> > 
> > Unlocking is shared.  goto unlock is fine.  But that doesn't help with
> > the very long lines.  (I am not saying that goto unlock is a worthwhile
> > patch to send but I would definitely have found it tolerable).
> > 
> > regards,
> > dan carpenter
> 
> 
> Khadija,
> While you are reworking this, just wanted to note that, once 'out:'
> becomes the single exit path for the function, it won't be a lie
> any more. So you will have addressed Dan's concern.
> Alison
>

Hey Alison,

Yes, I understand. Thank you. :)

Regards,
Khadija

> 
> > 
> > >  				}
> > >  			}
> > >  		}
> > > @@ -205,6 +201,11 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> > >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > >  
> > >  	return IRQ_HANDLED;
> > > +
> > > +out:
> > > +	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_COLDBOOT_TRIG);
> > > +	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> > > +	return IRQ_WAKE_THREAD;
> > >  }
> > >  
> > >  /*
> > > -- 
> > > 2.34.1
> > > 
> > 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
