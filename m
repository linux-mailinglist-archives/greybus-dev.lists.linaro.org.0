Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D306D43A4
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFB2D3EE2E
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:33 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by lists.linaro.org (Postfix) with ESMTPS id 9EA7F3EA49
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 01:21:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=X9MbgiVA;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.44 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id b20so111142260edd.1
        for <greybus-dev@lists.linaro.org>; Sun, 02 Apr 2023 18:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680484916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cy9vAKh1SRYsjRJ8W4Bk+i1NkUBPumqbVrEbWjhh5Fc=;
        b=X9MbgiVAqpAsMwjKEaSh1WtuNTtZP+qfKhbY0jGwZFSScHv16z4rRic/5SO9E0ZMDO
         Ut0paFXlg6zg1emacna3VdXOs9WevneldVXVYmD5SIUKMdBHqklbqOeBKoRpjIqFG7LR
         +Q+KvC2qNwDVOQADLPQsDIP3DtuulQIObKkygyz31ooSXCzCl1cia/2+9gZ+6oekvbIb
         j73kvCPkeVcb5IGBtT3/qA5YGCLUnQZpHjxbFX/oseJOQAjq62SCPBoHOOw1HAKOCsNw
         JIuBJO5VNcP57WdvS2k7YZve6DiIcSSlmVhwQo10NTAaQsJ8ojwsZLpsZVGR+86vzDxe
         TbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680484916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cy9vAKh1SRYsjRJ8W4Bk+i1NkUBPumqbVrEbWjhh5Fc=;
        b=5jP0m+2HthKkilGz91FeUk+2AA5tqJpM3JKC7GnLeUrS3z5eeLUzEjplTAllxOqc64
         vZbkxGBkmlFJQTzVGyRxYr2t856Hn2N1DiNUYMd604lzh7VBLhgszUkL1oZ0fRwU8+ZZ
         8CnPbBfjk8iZi5SbcTRxKtty4arl5xcpBwyYkGZ/qnt8i9auu+bObl7aaxIDnsOb9h2q
         NhyfgAQf6Vqh8CKz7acrMLscjmN1xuWu/THs+rrFwKEzemSVu8GJLDDIYJqbw/soDTRd
         SFt5m+OJG+K2UGCTYFJhytgG36jPvQAq1UlxU9Hke8Kx2QggukOpUnONOLSeLvhKAqdn
         K3pA==
X-Gm-Message-State: AAQBX9fQRLUYxIMUr2vNkjuTGMUz9WbIpg20c5YlENQlPdds2xL4mtAm
	abC8TDnnfUxUTIibQi1hFZA=
X-Google-Smtp-Source: AKy350bNl1jreipDIob/3r+nXH8ZnNBarE8ORo0800gplNiVNhtpMvqSInA6zXj85vzaItVXHL2H/g==
X-Received: by 2002:a17:906:8053:b0:93b:5f2:36c with SMTP id x19-20020a170906805300b0093b05f2036cmr30131818ejw.61.1680484916462;
        Sun, 02 Apr 2023 18:21:56 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090630ce00b0094596ff8240sm3783596ejb.110.2023.04.02.18.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 18:21:56 -0700 (PDT)
Date: Mon, 3 Apr 2023 06:21:53 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <ZCoqMSy1Ary0sAp9@khadija-virtual-machine>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <642a1fdcb2648_394c3829469@iweiny-mobl.notmuch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9EA7F3EA49
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[39.41.14.14:received,209.85.208.44:from];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org,intel.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.44:from];
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
Message-ID-Hash: 5NFPXQ3MV3B556KAGHF3XOTGI7MGKZUZ
X-Message-ID-Hash: 5NFPXQ3MV3B556KAGHF3XOTGI7MGKZUZ
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:42 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: add a single exit path to arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5NFPXQ3MV3B556KAGHF3XOTGI7MGKZUZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 02, 2023 at 05:37:48PM -0700, Ira Weiny wrote:
> Khadija Kamran wrote:
> > arche_platform_wd_irq() function has two exit paths. To make the code
> > more readable, use only one exit path.
> > 
> > Suggested-by: Alison Schofield <alison.schofield@intel.com>
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>

Okay, noted.

Also, would it be okay to send a patch revision with the changes or
should I wait for the feedback on Dan's comment. Here is a link to it:
https://lore.kernel.org/outreachy/6ce8aa34-e600-4d6a-adad-ead8255342e5@kili.mountain/

Thank you!
Regards,
Khadija 

> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> >  drivers/staging/greybus/arche-platform.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> > index fcbd5f71eff2..a64c1af091b0 100644
> > --- a/drivers/staging/greybus/arche-platform.c
> > +++ b/drivers/staging/greybus/arche-platform.c
> > @@ -153,6 +153,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
> >  static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  {
> >  	struct arche_platform_drvdata *arche_pdata = devid;
> > +	irqreturn_t rc = IRQ_HANDLED;
> >  	unsigned long flags;
> >  
> >  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
> > @@ -180,9 +181,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  						WD_STATE_COLDBOOT_START) {
> >  					arche_platform_set_wake_detect_state(arche_pdata,
> >  									     WD_STATE_COLDBOOT_TRIG);
> > -					spin_unlock_irqrestore(&arche_pdata->wake_lock,
> > -							       flags);
> > -					return IRQ_WAKE_THREAD;
> > +					rc = IRQ_WAKE_THREAD;
> >  				}
> >  			}
> >  		}
> > @@ -204,7 +203,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
> >  
> >  	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
> >  
> > -	return IRQ_HANDLED;
> > +	return rc;
> >  }
> >  
> >  /*
> > -- 
> > 2.34.1
> > 
> > 
> 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
