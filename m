Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22A6BDBF5
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6DCCC3EB82
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id 1322E3E959
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:24:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=qRlBKCXO;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.50 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id bw19so6930360wrb.13
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 22:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678515863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KEAB5UcFKezf78Y1Bog4LTa3d4NoqJ+/Ij4qU9A9IPM=;
        b=qRlBKCXOGW8I0xIQseEgSFEYMVA2cZq4nrO1Y1iZTSKp3cUIe/mIYsvH4wNUEvBWmQ
         /e6Ni0ss8msM+FSMTy+7KUG7xVEHhQ6ANHjr/5uUsSonnjbb/6wa64f4XB9JJ8iZITK2
         OHGtcjGmTnDTGMPfxXrpgLI8y+uDogS9Kpk++e4biWraJnxnbeg6QIfyrEm9huKaDCwz
         iosk6VIuoSS6HOdACj6Sc4mdrQJriqsZySlEnpDr67EZS0klL/1DoIBRJekPh1w7V+ld
         kfPFHb/bii2T/uF1xmZ7WisM37dxYmJrSGQopqatKWutC4Kn4ac9bvJQU7C0GyNH6jS7
         FUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678515863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEAB5UcFKezf78Y1Bog4LTa3d4NoqJ+/Ij4qU9A9IPM=;
        b=MOtyMqjOS3rCHEayopO81wZ/kxGZn9GhazM8469Ko0aIPpuAoVWoef4/b99OfiVdrR
         6BM/a0kE0QOGg8D0HHdEMTvrlLJkP5CHVlB8AcRsk3zqz9wqPkLwNYvTANOw5S6Y2qAB
         SE1Onkfzld/QfW7u+g/fnXUOaxxOWpTMTxE0fc5Mg8L3c8COuLqU7pXbVsZbJeviEg/8
         1HC2oAL5nNDRFvGGddqZyEoSY5fU1KwPu9iMjx3mB8JMpd/M6+YYKWO99n5XoEc1NyKJ
         w1LuctlHQv6lTAtaYvbOwG730fw3IlWIwOx5xT07HDpZR/udUy2XPGqdFyNvPDQEzpcU
         Q6ow==
X-Gm-Message-State: AO0yUKUpdAGSi4lA3T4KsXfUn8SF75tfngUlQORFV2r2jr1CvLXfIeFX
	8+EIk4ALpC7flCylMPVC5QzO3QgBz0xI5rqb
X-Google-Smtp-Source: AK7set8Jzcnic34saMsxy6VPjJLGDWjdB3YrVpyVGMeXFbMQMcUhMKG2K1kpLHtNqeccy1biBp1AMA==
X-Received: by 2002:a5d:67d2:0:b0:2ce:3a46:cef with SMTP id n18-20020a5d67d2000000b002ce3a460cefmr16390394wrw.3.1678515862847;
        Fri, 10 Mar 2023 22:24:22 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d58c7000000b002c55521903bsm1549822wrf.51.2023.03.10.22.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 22:24:22 -0800 (PST)
Date: Sat, 11 Mar 2023 11:24:20 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Message-ID: <ZAwelPOv45zThK6j@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1322E3E959
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.50:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SQPBF2UJ5KSCHT3XHPSVAQ4MCKRJOHXG
X-Message-ID-Hash: SQPBF2UJ5KSCHT3XHPSVAQ4MCKRJOHXG
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:52 +0000
CC: outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SQPBF2UJ5KSCHT3XHPSVAQ4MCKRJOHXG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > In file drivers/staging/greybus/arche-platform.c,
> > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> >   line.
> > - If condition and spin_unlock_...() call is split into two lines, join
> > them to form a single line.
> > 
> > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > ---
> > Changes in v2:
> >  - Change the subject and log message
> >  - Merge if condition and spin_unlock...() from two lines to one 
> 
> Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> see the problem.

Hey Dan!
When I run checkpatch.pl on my file, I can see that my old CHECK no
longer exists instead a new CHECK is mentioned saying 'Alignment should
match open parenthesis'. I understand this from your previous email.
Should I stop working on this file and leave it as is?
Thank you!
>
> regards,
> dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
