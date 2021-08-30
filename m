Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AED3FB5BD
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 14:16:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 37E9861B00
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Aug 2021 12:16:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B7EE6610D0; Mon, 30 Aug 2021 12:16:53 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 17284606DA;
	Mon, 30 Aug 2021 12:16:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A7F0560418
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 12:16:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A5B13605D7; Mon, 30 Aug 2021 12:16:49 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by lists.linaro.org (Postfix) with ESMTPS id 98E4260418
 for <greybus-dev@lists.linaro.org>; Mon, 30 Aug 2021 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/4QXEOD8J90syLrjyDkqaGDPwNN8IRPTqOTnnGhg5bE=; b=F32ICRcAQBjiJyGtar49N+Z/Sh
 uuXfh3zJ/mZOaU1k09f+TlsxTeDYq+PiRXzAzswu3OQ2cAK8BTl6CqDRNDoZ87becadLx4jsxJLgQ
 nRA775w3F4BudAIxRhoLl6qU6OI62n8TmviYdtp3Ibg6CjVzEHimsyDO2ptD4V3k8KUzq2uxwHdJU
 0R15nMIMeeWh3vy1gcRz5icm9aG8/WHaLXPmjnFTRtw1bgKdcdhnzPtvr/AlXr3jqMftN+pl5UI+a
 2lTmkZLFGmOY1L5Gs99X0Kz+T7HF9AhLyJ0Ypqhs/MlbvBAr+0DVs1OSCx3zbQ034zn7SlxZsTjxT
 m7m5/mbw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mKgCt-00083W-1T; Mon, 30 Aug 2021 12:16:18 +0000
Date: Mon, 30 Aug 2021 13:16:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YSzMB80NOkNvdjy1@casper.infradead.org>
References: <20210829092250.25379-1-fmdefrancesco@gmail.com>
 <YSyg/Db1So0LDGR+@hovoldconsulting.com>
 <2879439.WEJLM9RBEh@localhost.localdomain>
 <YSzGkNfG6HOayiXi@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSzGkNfG6HOayiXi@hovoldconsulting.com>
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
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 30, 2021 at 01:52:48PM +0200, Johan Hovold wrote:
> Whether the API is better is debatable. As I said, almost no drivers use
> the new XArray interface, and perhaps partly because the new interface
> isn't as intuitive as has been claimed (e.g. xa_load() instead of
> ida_find()). And IDR/IDA isn't marked/documented as deprecated as far as
> I know.

I can't just slap a 'deprecated' attribute on it.  That'll cause a
storm of warnings.  What would you suggest I do to warn people that
this interface is deprecated and I would like to remove it?

Why do you think that idr_find() is more intuitive than xa_load()?
The 'find' verb means that you search for something.  But it doesn't
search for anything; it just returns the pointer at that index.
'find' should return the next non-NULL pointer at-or-above a given
index.

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
