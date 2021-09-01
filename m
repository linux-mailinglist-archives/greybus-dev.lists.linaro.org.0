Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFC3FDED5
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Sep 2021 17:39:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1ABB5610CB
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Sep 2021 15:39:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 93AAD60F1F; Wed,  1 Sep 2021 15:39:56 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 84ECE60A92;
	Wed,  1 Sep 2021 15:39:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 527506055A
 for <greybus-dev@lists.linaro.org>; Wed,  1 Sep 2021 15:39:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 391CA60A59; Wed,  1 Sep 2021 15:39:52 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by lists.linaro.org (Postfix) with ESMTPS id 28F4F6055A
 for <greybus-dev@lists.linaro.org>; Wed,  1 Sep 2021 15:39:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id h9so7627671ejs.4
 for <greybus-dev@lists.linaro.org>; Wed, 01 Sep 2021 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gtxtlf+IvPbb5S4KUDPGBv/IseOgDOneCJ4TI1+PC5w=;
 b=W9ttA5JKJsbe0026yGjy3AiJE2JS0BQJeNEshdziMVwGYYqu4uTR16v5ftqqA5LoTd
 R0kfilGPdNJzDInnXmcLdLsV89icUPFbRoWSULCF7JpvmJdYIsxjbfYvzPk9E5yST5pL
 mhFJ4LKxRqjO5VuaKtvGCFeEg9wfXGX1XXLwbn0HsvuQ+WudH2hiQE8r54d16beCvUBd
 tScsJ8V8h0Cq4BG+N008WF3PjMDu51fGjfRF6r2N2dZU3GyUV1k94Y0WWnPAdqlXbZYA
 p31PLd+vlxa47cVzrp3ubhBBbVPDAlyeyqITHb81u5M4F2xO2Ow+FPta/XQqCr9JMUIq
 mNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gtxtlf+IvPbb5S4KUDPGBv/IseOgDOneCJ4TI1+PC5w=;
 b=kXYqdAAkMpDKAaY4rQw5VdljfuWBgzRsXwHS+mbT4ELvyvpmKLqMEnFGKfjfg2P3CZ
 YBQwCvWKpNRIxtwXUGBNiu/XOxbYhUYEQ5gRw1vCL3niiX58vTUa/esWRPDTCyEsoAm4
 GkS/Ki0wJdYIXM7oxaLHJkr6FlOuVE5NQUwDcA0TclZUVW/Wp8oloQ7VArFGwjUfdbJq
 4vi2HmxkJmISm1sVGNNOGKwM4Ycd93vFyRWhhYKgxNQpNiq98cT5GtfNkbAaPynrHmqJ
 h/5hHrC5QDMDOSlOUt23WuR3zgkueqDR5QhPIbW1e1fBh8Qh0oVyugfNQ/CwCmR8CVnI
 79iA==
X-Gm-Message-State: AOAM530phkzyd4kQATBeIuLR4fdc1sM9iaGlEgXovHFIdGlngu59ES2W
 WYCRjN8Qpy7rNMcRvfLyp+4=
X-Google-Smtp-Source: ABdhPJy43iwSCZVMf2T5xtACWqKltQuAv2LAC08MVHPt3txFGtmVbJKC2vEoNDAeA6yK6ZRYJRi8bg==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr54387ejf.416.1630510789079; 
 Wed, 01 Sep 2021 08:39:49 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
 by smtp.gmail.com with ESMTPSA id qq16sm17102ejb.120.2021.09.01.08.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:39:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 01 Sep 2021 17:39:46 +0200
Message-ID: <2942098.x5hDSQIzYV@localhost.localdomain>
In-Reply-To: <YS+ORkbD9NuEOl0D@casper.infradead.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <8914101.vIO1HAjRha@localhost.localdomain>
 <YS+ORkbD9NuEOl0D@casper.infradead.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v4] staging: greybus: Convert uart.c from
 IDR to XArray
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, Alex Elder <elder@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wednesday, September 1, 2021 4:29:26 PM CEST Matthew Wilcox wrote:
> On Wed, Sep 01, 2021 at 03:56:20PM +0200, Fabio M. De Francesco wrote:
> > Anyway I tried to reason about it. I perfectly know what is required to 
> > protect critical sections of code, but I don't know how drivers work; I 
mean 
> > I don't know whether or not different threads that run concurrently could 
> > really interfere in that specific section. This is because I simply 
reason in 
> > terms of general rules of protection of critical section but I really 
don't 
> > know how Greybus works or (more in general) how drivers work.
> 
> From a quick look, it is indeed possible to get rid of the mutex.
> If this were a high-performance path which needed to have many threads
> simultaneously looking up the gb_tty, or it were core kernel code, I
> would say that you should use kfree_rcu() to free gb_tty and then
> you could replace the mutex_lock() on lookup with a rcu_read_lock().
> 
> Since this is low-performance and driver code, I think you're better off
> simply doing this:
> 
> 	xa_lock((&tty_minors);
> 	gb_tty = xa_load(&tty_minors, minor);
> 	... establish a refcount ...
> 	xa_unlock(&tty_minors);
> 
> EXCEPT ...
> 
> establishing a refcount currently involves taking a mutex.  So you can't
> do that.  First, you have to convert the gb_tty mutex to a spinlock
> (which looks fine to me), and then you can do this.  But this is where
> you need to work with the driver authors to make sure it's OK.

Dear Matthew,

I think that I understand your suggestion and, as far as my experience with 
concurrency in userspace may have any relevance here, I often use reference 
counting with objects that are shared by multiple threads.

Unfortunately, this is not the point. The *real* issue is that I am not able 
to provide good reasons for doing IDR to XArray conversions in Greybus code. 
I tried to provide some sort of motivation by using your own words that I 
still remember from a message you sent a couple of months ago: 

More or less you wrote:

"The abstract data type XArray is more memory-efficient, parallelisable, and 
cache friendly. It takes advantage of RCU to perform lookups without locking. 
Furthermore, IDR is deprecated because XArray has a better (cleaner and more 
consistent) API.".

I can reason on the "cleaner and more consistent API" and for what I 
understand from the grand design of the implementation of XArray I may also 
attempt to discuss some of the other parts of the above-mentioned statement.

Anyway I must respect the point of view of Johan H.: "And remember that a 
good commit message describing the motivation for the change (avoiding 
boiler-plate marketing terms) is a good start if you want to get your patches 
accepted.". That's absolutely fair and, I say that seriously, I must follow  
this rule. Since I'm not able to do that I understand that I have to desist.

If it depended on me I'd like to convert as many possible drivers from IDR to 
XArray, but it seems that many maintainers don't care (even if the work was 
perfect in every detail since v1). I guess they have their reason to think 
that the trade-off isn't even worth the time to review. I'm yet not sure that 
IDA to XArray is worth as much as IDR to XArray is. But for the latter I 
would bet it is.

Please, nobody should misunderstand me. I know that I'm going well beyond 
what my experience may permit to say about this matter. I'm just expressing 
my opinion with no intentions to push anybody in any direction. Please 
forgive me if this is what it may seem to the readers that are following this 
thread.

Thanks,

Fabio


_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
