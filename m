Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9416BDBF7
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 128803EBAF
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	by lists.linaro.org (Postfix) with ESMTPS id 77DF83EE23
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 07:16:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=Hyh6q2af;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.43 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id f11so6992512wrv.8
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 23:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678518991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOeXrcTnNWbTzKi6E9l84Z2v2QMvdCtKFsEt5GB4CRU=;
        b=Hyh6q2afJ81eWMsTciI6oeov2twf4NTSgFWhvvm3jnGh1QYJO2VXkgiAVWM8/B7g+e
         xjoUyK70agYunrw8KHq85mq5RsvTdveeVbqvumPIeIOoqmY8A8sWKiVqNL+MXvrOWPIH
         oJIvaMpyGwp4rLAxUPzZKz4g/5ETHLsw3C0wJQNFnrFAKLBUN69Vh+7Vujl2g0wOcR9d
         mK/9/lcxXWmOW+hkf5oGhhw/oqGRaJ2oW1tgsTevQ5P7xjriBXZZzkntKEOHw3glPhX0
         MOdEEwjnXnmwr3RFSxC4I/tZjr9eRi5xNUkHwB3XlinT87hpi2P8OH/y6VxmL+yFLrS0
         EBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678518991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOeXrcTnNWbTzKi6E9l84Z2v2QMvdCtKFsEt5GB4CRU=;
        b=qdXC30tn+PoVmDWGttleem+RvWY5M7zJpWwoRY3ABvMiu1cwAx/7E3/JqBJ0rNCjzv
         PDMVOH17xwmmrJGI+ttZ3oA6Ze358Qy7KGnKNO4asxH+Uc2PXSLTkZeabX5M8KGLefIP
         mFgZ5gL2d+1mEq40rzaFPKt4OEVXbj9Tr+VECh69dMyyT610aodz8rxVgJJ8HqLmdMB5
         RrlwZnBRcun9qMff42rl9ojDbDrqZaQvlPen1dUNT60xiKzDgUWvXU5P4G+vXXvU4mFB
         eKKD5Xd5JuLkhYeMnT6bEKakCckHPlCyvBJnzEvYz3oXxjXxnkMpmzduTGuRJkWgRvia
         yYXA==
X-Gm-Message-State: AO0yUKWofrKYK63eJXr/oyf+yLNrsowXeldgnQTAyVodfF7eDqgr8gXh
	+GvfIplF2LofyH7g7LyCPuM=
X-Google-Smtp-Source: AK7set/MQHjs+2HnUEPKYvtMPFzjUMd8XL/gPJgsXRh4Zdcc0tiom//uHYHVwT7zGDPiVCsnYinlMA==
X-Received: by 2002:adf:eb50:0:b0:2c7:1dd5:7918 with SMTP id u16-20020adfeb50000000b002c71dd57918mr17307669wrn.28.1678518991270;
        Fri, 10 Mar 2023 23:16:31 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id s11-20020a5d4ecb000000b002c70851fdd8sm1655094wrv.75.2023.03.10.23.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 23:16:30 -0800 (PST)
Date: Sat, 11 Mar 2023 12:16:28 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <ZAwqzPeLh1Dm10EJ@khadija-virtual-machine>
References: <ZAusnKYVTGvO5zoi@khadija-virtual-machine>
 <6e9fd119-6566-4778-899e-bc5a7ee7830c@kili.mountain>
 <ZAwelPOv45zThK6j@khadija-virtual-machine>
 <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZAwoTVeMDGu/44Ln@ubun2204.myguest.virtualbox.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 77DF83EE23
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.43:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5XTELMBQTDRUNGJGJEFY54SU6WLQZDBQ
X-Message-ID-Hash: 5XTELMBQTDRUNGJGJEFY54SU6WLQZDBQ
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:53 +0000
CC: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: remove tabs to fix line length and merge lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5XTELMBQTDRUNGJGJEFY54SU6WLQZDBQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 11, 2023 at 12:35:49PM +0530, Deepak R Varma wrote:
> On Sat, Mar 11, 2023 at 11:24:20AM +0500, Khadija Kamran wrote:
> > On Sat, Mar 11, 2023 at 07:16:19AM +0300, Dan Carpenter wrote:
> > > On Sat, Mar 11, 2023 at 03:18:04AM +0500, Khadija Kamran wrote:
> > > > In file drivers/staging/greybus/arche-platform.c,
> > > > - Length of line 181 exceeds 100 columns, fix by removing tabs from the
> > > >   line.
> > > > - If condition and spin_unlock_...() call is split into two lines, join
> > > > them to form a single line.
> > > > 
> > > > Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > >  - Change the subject and log message
> > > >  - Merge if condition and spin_unlock...() from two lines to one 
> > > 
> > > Apply your patch and then re-run checkpatch.pl -f on the file.  You will
> > > see the problem.
> > 
> > Hey Dan!
> > When I run checkpatch.pl on my file, I can see that my old CHECK no
> > longer exists instead a new CHECK is mentioned saying 'Alignment should
> > match open parenthesis'. I understand this from your previous email.
> > Should I stop working on this file and leave it as is?
> 
> Hi Dan,
> Not trying to speak for you, so please override my message if this is
> inaccurate.
> 
> Hi Khadija,
> Yes. It is not useful to resolve one warning and introduce another. Tomorrow
> someone else is going to try and revert it. So do not make the "remove tab"
> change. I still like the merging of the split lines. It appears to improve code
> readability. You can send in a v3 with just that merge change and wait for
> feedback.
>
Hey Deepak, 
Thank you for the feedback. Before sending a patch v3, I think I should
wait for more feedback.
> Also, remember to check your change with checkpatch. There is a section about
> post-commit hooks on the tutorials page. This will allow you to integrate
> checkpatch as part of your git commit step and do the job for you.
> 
> And also, always build your change locally on your machine. No new warnings or
> errors should arise.
>
Yes I will keep that in mind for next patches. Thank you!
> Hope that helps.
> Deepak.
> 
> 
> > Thank you!
> > >
> > > regards,
> > > dan carpenter
> > 
> 
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
