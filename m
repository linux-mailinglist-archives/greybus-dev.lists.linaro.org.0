Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 824B33F6EC3
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Aug 2021 07:20:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2683961C3D
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Aug 2021 05:20:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AC6F162CF6; Wed, 25 Aug 2021 05:20:11 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 68829610CB;
	Wed, 25 Aug 2021 05:20:08 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A49ED60749
 for <greybus-dev@lists.linaro.org>; Wed, 25 Aug 2021 05:20:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A254E610C6; Wed, 25 Aug 2021 05:20:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by lists.linaro.org (Postfix) with ESMTPS id 99FE060749
 for <greybus-dev@lists.linaro.org>; Wed, 25 Aug 2021 05:20:05 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id g22so4682242edy.12
 for <greybus-dev@lists.linaro.org>; Tue, 24 Aug 2021 22:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jY+zZq2r8622JGPGrLQZJIpbL7Iz4oXWiLOi7adzQ3I=;
 b=d3VK8Dr+N1GcxePH0NDEA/LUKnGHqOzFVRvHyqvlvLRjdab0F5RBZSkaRcFP+u/K09
 uiH56ralxHS7LlBSnXE5P0ZxGg/2Uz4BVLuIybN3/zGGBLikmhz76wRbSgH+oiaalfHe
 pFgLD6HJpgIw9uAAduHl3AYor9LRSUcore814fan6T6HU5i3U9sZ1FTtncAySl9T9dOS
 YRME256okfHhxzUn5jkRUoWIdNn/m8QqwtjAMY6G7T40PgOwCG+BVZCv+cYbzUwvK6cI
 NIHWc6MDnC/YQl+A7HEUDEVIDjy3BY40GJHI9o7PvYhsheR1uzjWgUvbyfFT69wxy8zz
 QaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jY+zZq2r8622JGPGrLQZJIpbL7Iz4oXWiLOi7adzQ3I=;
 b=D1us9tBSQMFXFuxXL7P97fZrKnoyswxduTUFWNyP7JFU6OPcJE4Jgdjku+HKo8yEjN
 lOCpMvmGDK5gr96Iayt/FNO63+OiSCpbA0uFACe3hYaoEL+ozsG6aiv/ykZKYx38yrYN
 urcG6y/57h8Bpx1HN4/w6/V8Nmq2u6pYY64ouw6Gkqk+dqJ2rTKtAhGgVemKik4FAFVF
 Q0144zbmqh3sUXR54a9TRmGF+fKAWwYQC/G1/0snG3meYukxK3Yc7Xhnwc+/F7JLDmIh
 nkH3iAeOi89OZVUOQ6zo6RTgRfrW9N6wBsgRRdQKjFGutlSHsXNbOKxMZrs/L5WVMhE8
 rBgA==
X-Gm-Message-State: AOAM532Ums1ZScuu3Vx2HGmTGrqk5Dx02PE/KfFtyTLNpzgrHs3wnJ09
 SClkdJpbwRjA+CkplUg5pmg=
X-Google-Smtp-Source: ABdhPJxSBd0ordI8c1npA88Ina6r+eyPMV31ugVml+px3ybGjsc5RHWR97LuxgY4kk2x4CJ0L41Q+g==
X-Received: by 2002:a05:6402:22d0:: with SMTP id
 dm16mr45386460edb.107.1629868804079; 
 Tue, 24 Aug 2021 22:20:04 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
 by smtp.gmail.com with ESMTPSA id n15sm12854669edw.70.2021.08.24.22.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 22:20:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Elder <elder@ieee.org>
Date: Wed, 25 Aug 2021 07:20:02 +0200
Message-ID: <1838037.Ul9q4Z07vA@localhost.localdomain>
In-Reply-To: <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
References: <20210814181130.21383-1-fmdefrancesco@gmail.com>
 <5541b638-db1e-26f2-2682-81f35504c9a3@ieee.org>
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

On Monday, August 16, 2021 4:46:08 PM CEST Alex Elder wrote:
> On 8/14/21 1:11 PM, Fabio M. De Francesco wrote:
> > Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
> > is more memory-efficient, parallelisable, and cache friendly. It takes
> > advantage of RCU to perform lookups without locking. Furthermore, IDR is
> > deprecated because XArray has a better (cleaner and more consistent) API.
> 
> I haven't verified the use of the new API (yet) but I have a few
> comments on your patch, below.
> 
> 					-Alex

Dear Alex,

On August 16th I submitted the v3 of my patch ("staging: greybus: Convert uart.c 
from IDR to XArray"), with changes based on the comments you provided.

Could you please take a few minutes to review this too? I would really appreciate it.

The v3 patch is at https://lore.kernel.org/lkml/20210816195000.736-1-fmdefrancesco@gmail.com/

Thanks,

Fabio

P.S.: I'd also like to know if you think it's worth converting IDA to XArray in order 
to improve the Greybus driver in staging.

  


_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
