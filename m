Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C906D43A3
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:37:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D32BC3EE2E
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:37:27 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lists.linaro.org (Postfix) with ESMTPS id E0C723EA49
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 01:18:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=dLHXvYgH;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.51 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id y4so111182278edo.2
        for <greybus-dev@lists.linaro.org>; Sun, 02 Apr 2023 18:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680484729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PCe8S/ZbFd32iadHpAz74xiVMxjzJpl0e1TXToqxByE=;
        b=dLHXvYgHmYqyccRY2uuFhwOgBFDIo3F86iRmdDZTyn3rMWnUpbyXL2IekVDNFxr2oy
         u6TuP7SrkKFnHxfVHdJZ7ALGLUsx29yYq5vrB6Y6kSkBz/YEk5gicWb9Gm7yZm7oWao6
         2C/tyOTc8OStItqLrr4KgiRt4/sxgNsjUTWrYwnPvLOAmcVHHqp4p8fdIsIHuApgsmNE
         MRoC9BcsDspMkS+B5N5+rLj8VATdwg1do9oqvOmC5AZmx7z1hMaAJ53ERkxk1HqAv1p0
         j9kaXJIY1Jp/mHR3rM3vR3BVCtDU1t9VrDxT/4jwVHjNC501+b8Gs+4sPOSKoCnYg0bk
         pUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680484729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCe8S/ZbFd32iadHpAz74xiVMxjzJpl0e1TXToqxByE=;
        b=7+8TGR9dd3x1+In73Gxdb9RtCuifkG99mO1Q1rTW5Jon4008KqT5pV8ns4KsEaMszC
         iJGFF/D5S8ttH2MOCMkbig1N0i+3bLfSXJ+kMCCIQsIv5Uu4zbM6c2vFdvAO13Kl1DQO
         chXJnb80AeCEvztgAgFdS1E/ru3+rKi8Htogk4Y1uLKY8cA5h5ycGPYxIikAX/04hTH6
         uZX+NmWPv/4rfJmcNnplcXioo7800kfJnjlFPzo8WeomR+IlkP4a8JWcTDTgLfNFjtzY
         x33qFdfxK+wbT7TUmzJcgr/BkNoJ6v/rlk8RlTD+1Qr/jsanAdgFLSzQrzB0leoo2qn0
         yc2g==
X-Gm-Message-State: AAQBX9d3yvBJkIdy5IFAlv5LtrXB1doSD767LtPG+uzFFLFLp30qTH2g
	Mfl9hjbU8o/HPwaur8Pb5O8=
X-Google-Smtp-Source: AKy350YWt3CDxWTeY0hg8BwCbo95PeMJlu9paedE93oDJkKi6SgsUSRjo0xEjz8VrWMiCMbDvVsWgg==
X-Received: by 2002:a17:906:7193:b0:931:7adf:547e with SMTP id h19-20020a170906719300b009317adf547emr35949132ejk.70.1680484728696;
        Sun, 02 Apr 2023 18:18:48 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id dx1-20020a170906a84100b0093048a8bd31sm3792039ejb.68.2023.04.02.18.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 18:18:48 -0700 (PDT)
Date: Mon, 3 Apr 2023 06:18:45 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <ZCopdYy7wMGEVx5P@khadija-virtual-machine>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
 <642a1f88bd232_394c38294a5@iweiny-mobl.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <642a1f88bd232_394c38294a5@iweiny-mobl.notmuch>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E0C723EA49
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[39.41.14.14:received,209.85.208.51:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.51:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WADH4KIHE6FNFNSGMERQDOQHCRO3ETWU
X-Message-ID-Hash: WADH4KIHE6FNFNSGMERQDOQHCRO3ETWU
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:42 +0000
CC: outreachy@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/2] improve arche_platform_wd_irq() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WADH4KIHE6FNFNSGMERQDOQHCRO3ETWU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 02, 2023 at 05:36:24PM -0700, Ira Weiny wrote:
> Khadija Kamran wrote:
> > Improve arche_platform_wd_irq() function to minimize indentation and fix
> > checkpatch issues.
> 
> Minor point but the cover should have
> 
> 'staging: greybus: ...'
> 
> ... for the subject.
>

Hey Ira,

Sorry, my bad! I missed it by mistake.

Regards,
Khadija

> The function name is nice but it is a pain to look in the code to know
> what part of the kernel this series is for.
> 
> Ira
> 
> > 
> > Khadija Kamran (2):
> >   staging: greybus: add a single exit path to arche_platform_wd_irq()
> >   staging: greybus: refactor arche_platform_wd_irq()
> > 
> >  drivers/staging/greybus/arche-platform.c | 84 ++++++++++++------------
> >  1 file changed, 43 insertions(+), 41 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> > 
> 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
