Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 132343EEAC3
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Aug 2021 12:17:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E3C9360C2C
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Aug 2021 10:17:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E436461179; Tue, 17 Aug 2021 10:17:22 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E2EA86075B;
	Tue, 17 Aug 2021 10:17:19 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C573060440
 for <greybus-dev@lists.linaro.org>; Tue, 17 Aug 2021 10:17:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C347D60733; Tue, 17 Aug 2021 10:17:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by lists.linaro.org (Postfix) with ESMTPS id BD8D760440
 for <greybus-dev@lists.linaro.org>; Tue, 17 Aug 2021 10:17:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id z20so37570898ejf.5
 for <greybus-dev@lists.linaro.org>; Tue, 17 Aug 2021 03:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9NWO6ngHHlNHXed0S7kJGpMxcXbrSjDwtrLrfdQYyBg=;
 b=Ul1sBQ84DdaXgLuqsa1OHtKPtr471qjFhsM+kaJqV179HfbZtdkkTVegqYgKC5pfC6
 hWdlsA8tnoh1CNMBZUa/bsamIQ5FSKUBRByTFNLO6C7f6ywVDyAPC/JZ6T+frKroyehM
 TirOiks3GBMR0c72MeYprKiKXEMPzDF087GKCAsKIlCExr93yW/KeL+CfeITu3Kw5l5w
 KhN+yIJRS6Fto1MHyJ7bDBz/JoTuCbW+X2A6UhvRoWWVccba6N8haM0OCfdrEJDBk0/6
 93VDn3jd1wvkiz5dH63ivrn81omg4UGMxkURMaM2wANCAJfmqcgJKacQ8/TTspNoH0wq
 ZB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NWO6ngHHlNHXed0S7kJGpMxcXbrSjDwtrLrfdQYyBg=;
 b=OKtHYRS1guktbRx9QQeyXsMprgXk2GyoozAFs2sTvDz44ft39rxaOQjwhD7msXjQmP
 tVNIRRu+SXSlVs1B1MWeoUVLq5eLxJq0uBdENPmPYaW6Kf6dAu8Ad9KyBYd1D3hV82Qo
 4njeCE4tPFD6171kV4LCwByWr98+48EhwPToUqZD8Hr54a54cimKyiaZ0NeEORpXRdbm
 0bunm8VKGcJzRJfyaKdF4WfFG+zOwbLnf0e7QpnlwL/P9c2rzK6vTEDcaEXBAre5dS1X
 an5FN7r0dFPi6Iv5HEfuZCaqueDJbDMrFnIxA8t/MjYI0R4UHrMaEWESpzfpGgLuHDV0
 Bq+w==
X-Gm-Message-State: AOAM531I53a4vMLpRSjd2fN2K2CW44l1q8/2shnt5DtNgVfkVRMvRhuR
 EC/3vp1RXmcLueFbB2hC+ug=
X-Google-Smtp-Source: ABdhPJy4Yp5lFmqUSAONjnFD5pN+tyukzcJDHoKMxBYIStSJOhK3Wz+PebwYGK8h3OOEDTQSSOyArg==
X-Received: by 2002:a17:906:53d3:: with SMTP id
 p19mr3148097ejo.509.1629195435792; 
 Tue, 17 Aug 2021 03:17:15 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
 by smtp.gmail.com with ESMTPSA id cb4sm558106ejb.72.2021.08.17.03.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:17:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 17 Aug 2021 12:17:13 +0200
Message-ID: <2337511.Rlusi4go5H@localhost.localdomain>
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
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
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
> 
Hi Alex,

As I promised in another message, I've already submitted a v3 of this patch:
https://lkml.org/lkml/2021/8/16/1188

While I'm pretty sure that XArray should be used in place of the older and less 
efficient IDR (some time ago Matthew Wilcox agreed and confirmed that this
is true), I'm not entirely sure if we should also prefer XArray over IDA for this 
particular driver.

Initially I had decided to convert the other greybus file from IDA to XArray but
then I stopped because of the above-mentioned doubts. 

I really don't know if it is worth doing this work. As far as I understand these API,
IDA (although it is not as versatile as IDR is) is more  memory efficient than IDR.
In documentation I read: "The IDA is an ID allocator which does not provide the 
ability to associate an ID with a pointer. As such, it only needs to store one bit 
per ID, and so is more space efficient than an IDR.".

May you please say if you think that the driver would also benefit by the 
conversion from IDA to XArray?

Thanks,

Fabio



_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
