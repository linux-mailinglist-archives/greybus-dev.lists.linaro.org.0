Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2873F8B5E
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Aug 2021 17:57:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF82162079
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Aug 2021 15:57:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 54FD961ECD; Thu, 26 Aug 2021 15:57:12 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7C54610D0;
	Thu, 26 Aug 2021 15:57:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A6212609A7
 for <greybus-dev@lists.linaro.org>; Thu, 26 Aug 2021 15:57:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 98EBC6102D; Thu, 26 Aug 2021 15:57:07 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by lists.linaro.org (Postfix) with ESMTPS id 8D8D2609A7
 for <greybus-dev@lists.linaro.org>; Thu, 26 Aug 2021 15:57:05 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id q3so5391549edt.5
 for <greybus-dev@lists.linaro.org>; Thu, 26 Aug 2021 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXF/RHrw7uR6voIrN0yU+7iqLQE1G5atkH2gmUQ8pZk=;
 b=RQJ9kvRCGzboqUPP5bbDLYsm7wHK3ezjmAWY1wP8SNnfLIS8HarSFZ7DJKNBFxOZyg
 T922M3YNTNVOXO+PbK4iL9ZJdNtmDV5GCGR3QRem4nQSsD520BwsZuLH410XfjbB7EQv
 fxg0GiydJw7Qzi/ur41bgIiyYrORoc/7NuAxot5EHb3QZUR6ae297ssxWmesAEMciV6y
 LFU5wczmGANMvf63O9yQFiIItalWhpi8XqxwqeTTUfmWXyWsCEGp2YBSQfY5bk7oiELJ
 Io/8CFj6cHPCYYeag+XZexMWmHNIhp29ydwdyuPOWHwfB4Z4TqgYQ9iN/r+93RjvaSHF
 OFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXF/RHrw7uR6voIrN0yU+7iqLQE1G5atkH2gmUQ8pZk=;
 b=i9sFLbTJS4gymLoJ0aR5+HTE6uIyb1hBH95bFkjTXhJVVfPsZskTpmq4zG83VxnDHy
 EMSiwMpeSxGYSg9HC2b1+kCWjff3oXdpJ8i5SXN+KnIKyHo4K6QF1xsYQxqsP7l8O1dk
 W0oq5j3/YWRYWP41ryBElFXOcBU+zFMktu8V2pKDXPn1pWQfL2C5/ZTA5Wtf6awEOkAZ
 QcKNVXkuA0dRi7TS+m395GVAiovT/8s4HHQmpGV+5F2xbbkFWlak7UmSgbFjd4kUMBq7
 M60Ryn47NFwzTmt9CS2HaEkIzvdbQFky6efayCE/TmI2faR3MdP4ERdheHDZRa7HmeHy
 TLuA==
X-Gm-Message-State: AOAM530uRzl8G99/ie9IIvsPUBJNlnBYyXMM4C4ZCovFMKWRqRxp1+wf
 tNAAkQ/zwjqKF1HGlb15B0A=
X-Google-Smtp-Source: ABdhPJwTDYtb8XcfblsJ7q7oQNNs+70i6Vv8+cvwvcrMtFQWph5GvGCGlXX7GD4Uq78wknF2uANqUQ==
X-Received: by 2002:a05:6402:354c:: with SMTP id
 f12mr4872206edd.287.1629993424411; 
 Thu, 26 Aug 2021 08:57:04 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
 by smtp.gmail.com with ESMTPSA id q5sm2080803edt.50.2021.08.26.08.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 08:57:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Elder <elder@ieee.org>, Alex Elder <elder@linaro.org>
Date: Thu, 26 Aug 2021 17:57:02 +0200
Message-ID: <8278430.GnBS7eVdlf@localhost.localdomain>
In-Reply-To: <335f30c7-8ab4-d46a-d415-e994997a3fa5@linaro.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <1838037.Ul9q4Z07vA@localhost.localdomain>
 <335f30c7-8ab4-d46a-d415-e994997a3fa5@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wednesday, August 25, 2021 3:45:13 PM CEST Alex Elder wrote:
> On 8/25/21 12:20 AM, Fabio M. De Francesco wrote:
> > On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
> >> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> >>> Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> >>> is more memory-efficient, parallelisable, and cache friendly. It takes
> >>> advantage of RCU to perform lookups without locking. Furthermore, IDR is
> >>> deprecated because XArray has a better (cleaner and more consistent) API.
> >>
> >> I haven't verified the use of the new API (yet) but I have a few
> >> comments on your patch, below.
> >>
> >> 					-Alex
> > 
> > Dear Alex,
> > 
> > On August 16th I submitted the v3 of my patch ("staging: greybus: Convert uart.c 
> > from IDR to XArray"), with changes based on the comments you provided.
> 
> Yes, I intend to review version 3.  I'm sorry I didn't respond to
> your earlier message; I am on vacation this week.
> 
> 					-Alex

Oh, there's no hurry, sorry to bother you while on vacation.
Even kernel hackers deserve a vacation at least once a year or two... :-)

Thanks,

Fabio

> > 
> > Could you please take a few minutes to review this too? I would really appreciate it.
> > 
> > The v3 patch is at https://lore.kernel.org/lkml/20210816195000.736-1-fmdefrancesco@gmail.com/
> > 
> > Thanks,
> > 
> > Fabio
> > 
> > P.S.: I'd also like to know if you think it's worth converting IDA to XArray in order 
> > to improve the Greybus driver in staging.
> > 
> >   
> > 
> > 
> > _______________________________________________
> > greybus-dev mailing list
> > greybus-dev@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/greybus-dev
> > 
> 
> 




_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
