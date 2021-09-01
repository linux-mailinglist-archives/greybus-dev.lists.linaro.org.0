Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B93FDD87
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Sep 2021 15:56:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1CF57610C3
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Sep 2021 13:56:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 10FCC60F1F; Wed,  1 Sep 2021 13:56:30 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AAF1D60A92;
	Wed,  1 Sep 2021 13:56:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2E69C600B7
 for <greybus-dev@lists.linaro.org>; Wed,  1 Sep 2021 13:56:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 221AE60A59; Wed,  1 Sep 2021 13:56:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by lists.linaro.org (Postfix) with ESMTPS id 1BFED600B7
 for <greybus-dev@lists.linaro.org>; Wed,  1 Sep 2021 13:56:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ia27so6794086ejc.10
 for <greybus-dev@lists.linaro.org>; Wed, 01 Sep 2021 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRrNhgrDIwSehOjM+0QWWad7e+b+lvVLJyyUCl9/Exk=;
 b=FewNOuSfaXBPf5PjzcdFZgDeR+uXL3OAdSKgY1radiJb0OnEwmABD866so4RSH96Iz
 PBSqXj/lVJs0NSGYjeucv81XG/L0GBO3ytFxLGqDvL2rm8xczWiyIDoHWQlB2UFWPAD7
 AfkW3KS1y+E6EvfBl3nVFaOlsKEp+n9NB0/JIE6wRcOgcWZjnKzr1rkS/YDoN5OZHQxZ
 bv2BkbLlZj+UiN+knYKxTXfOfYDqCyyheI7ka2b9QFQ2if58ZbIFqhPrx+mUSfzmNyFe
 9vjOIgFzR+8MOLauC57u82SGh/+nvGje5Voo4X/ryP0p9pJWnWUtqmgSDRCIXMcvyT6a
 em3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BRrNhgrDIwSehOjM+0QWWad7e+b+lvVLJyyUCl9/Exk=;
 b=gTJiTippXcIY5Q/qGJkDskbm+i+bH8/4JGD/pK46x/d9jAXs5c0dkQhCcOWTh0kzM/
 ZnQVRfKNXgkFVyDa8FwtG8r4aD/4GAlzjUgfy6oPnUzEdofbCvJZVvYBL0qgsTvSPsLI
 n0njSRW8kA0utjWQc4cXfGyKKnnGxQf+1ADYpKwgjOAQMj4u3HJhdxdx1vDWScU4BZBm
 /0kvk0fXXT1kuNGPT8lsL2dG0Dz87wIrXsHiQOvoCYtYQK8YQqEIvM1E37cwAdgs1hJr
 cysL+UAy18eiQkLNgO6Wab1fvZmke1sXCSl1o7nbrJnNcgszdvCYQ2gg00cYRSOQXn2f
 3Jwg==
X-Gm-Message-State: AOAM530Ys5X8OkKRUpniPAO7n6jr1qe4O8FWKcnlPIcBNH1DXNLYuOeK
 BE/isC679iXWW3NHEknq4Q4=
X-Google-Smtp-Source: ABdhPJx/c4ausu3jMt9m8i3ag5V/dPMIynN1X73PIVTKfku986poAoon7KEdUGEkoyOhKqDMx2BLKw==
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr37365394ejb.39.1630504582933; 
 Wed, 01 Sep 2021 06:56:22 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
 by smtp.gmail.com with ESMTPSA id bt24sm20384ejb.77.2021.09.01.06.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 06:56:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@linaro.org>
Date: Wed, 01 Sep 2021 15:56:20 +0200
Message-ID: <8914101.vIO1HAjRha@localhost.localdomain>
In-Reply-To: <794b3ff8-0240-ff14-8721-cdf510f52be3@linaro.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <6155058.TBsaUTXu4T@localhost.localdomain>
 <794b3ff8-0240-ff14-8721-cdf510f52be3@linaro.org>
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
Cc: linux-staging@lists.linux.dev, Alex Elder <elder@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wednesday, September 1, 2021 2:09:16 PM CEST Alex Elder wrote:
> On 8/31/21 6:50 AM, Fabio M. De Francesco wrote:
> > I was wrong in assuming that trivial patches to Greybus are welcome as 
they 
> > are for other drivers.
> 
> This is not a correct statement.

Yes, I agree: it's not a correct statement. Please let me explain what I was 
trying to convey with that consideration...

The Mutexes were there around idr_find() and I decided to leave the code as 
it was. Who am I to say that they are not necessary? I must stay on the safe 
side. First because I don't know how the drivers work (can that critical 
section really be entered by different threads that could possibly share the 
gb_tty that is retrieved by xa_load()? Even if xa_load() always give you back 
the right gb_tty, how do I know if in the while other threads change its 
fields or destroy the object? I guess I should stay on the safe side and 
leave the Mutexes there, exactly were they were.

These are the reason why v1 was indeed a trivial patch. But v2 *was not* 
because you wrote that you were pretty sure they were unneeded and you asked 
me to leave them or remove them and in either case I had to provide a reason 
why. 

I guess that in v1 I should not provide a reason why they are still there, as 
well as I don't have to provide any reason on why the greybus code (line by 
line) is as it is: it is out of the scope of my patch. Am I wrong?

Your note about the possibility that the mutexes could be removed pushed me 
beyond what I need to know to accomplish the intended task. 

Anyway I tried to reason about it. I perfectly know what is required to 
protect critical sections of code, but I don't know how drivers work; I mean 
I don't know whether or not different threads that run concurrently could 
really interfere in that specific section. This is because I simply reason in 
terms of general rules of protection of critical section but I really don't 
know how Greybus works or (more in general) how drivers work.

I still think that if I stayed within the bounds of my original purpose I 
didn't have to reason about this topic and that the v1 patch was trivial.
v2 was not!

I'm sorry because I'm still not sure if I was able to conveyed what I thought 
and still think.

> But as Johan pointed out, even for a trivial patch if you
> must understand the consequences of what the change does.
> If testing is not possible, you must work extra hard to
> ensure your patch is correct.

Again, I don't see any possible harm with the mutexes in place :)
 
> In the first (or an early) version of your patch I pointed
> out a bug.  Later, I suggested
>  the lock might not be necessary
> and asked you to either confirm
>  it was or explain why it was
> not, but you didn't do that.

This was beyond my knowledge and perhaps unnecessary (sorry if I insist on 
that :)).

> I agree that the change appeared trivial, and even sensible,
> but even trivial patches must result in correct code.  And
> all patches should have good and complete explanations.
>
>	- Alex

Is v2 correct with the mutexes restored where they were? I guess it is.

Thanks for you kind review and the time you spent for me. I appreciated it, 
seriously.

Fabio	


_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
