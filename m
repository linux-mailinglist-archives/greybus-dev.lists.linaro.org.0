Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7438162B
	for <lists+greybus-dev@lfdr.de>; Sat, 15 May 2021 07:33:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9612363502
	for <lists+greybus-dev@lfdr.de>; Sat, 15 May 2021 05:33:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7F614634FD; Sat, 15 May 2021 05:33:13 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D18D561A49;
	Sat, 15 May 2021 05:33:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A5B6F61A34
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 05:33:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A3AE861A48; Sat, 15 May 2021 05:33:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 8D48B61A34
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 05:33:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D64BB613F6;
 Sat, 15 May 2021 05:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621056786;
 bh=B5DTuF90EF+MWBCeDcVtLq3OnjCaNYSF5lomIO0RGQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MDgHYSDwbMxRyh7aLi9AleyT/VK1UINA89wMrBcREojdDcuy/nlfkMJGS36CyXrXT
 nUMExzSFgrlrIyv0ZdKoftobPMJ12vQE8uhU4+MBP2VobqXW8W4xBOjuG5wbmGzdlt
 hayrUtHQ16Z5fA/KD/DVflpAIJ61zk7QARtBL56E=
Date: Sat, 15 May 2021 07:33:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Message-ID: <YJ9dDwKMKkifeICJ@kroah.com>
References: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add declare_ to
 declaring macros
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
Cc: elder@kernel.org, linux-staging@lists.linux.dev, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Sat, May 15, 2021 at 09:11:16AM +0530, Shreyansh Chouhan wrote:
> Prefixed the names of all the macros that were used for declaring things
> with 'declare_'. This should help with clarifying about what these
> macros do.

Thanks, but I think I will leave the code as-is.  It's a good "test" for
people who try to modify the code without actually building it :)

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
