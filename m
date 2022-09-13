Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3115B6EA1
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Sep 2022 15:53:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E428479F8
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Sep 2022 13:53:37 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id B8C4347990
	for <greybus-dev@lists.linaro.org>; Tue, 13 Sep 2022 13:53:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3177B80E07
	for <greybus-dev@lists.linaro.org>; Tue, 13 Sep 2022 13:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FA7C433D6;
	Tue, 13 Sep 2022 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1663077212;
	bh=aup2nwX3kkZwT2fpjNlwE5UG1xXwi8SrWSRqDOplkjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfbWd0RBZMbNshwdkuNQn++nN9X0RLPcaK60s3OCX//2cV+ZO4x8O1r8IngPrFCEz
	 ywY+7pZvFCQQR5xXodV7/KoWSnkkbifRNW4BKYyMTp8yTZu9yGMI6f0SOyV6Uy0K1X
	 JwvOSOkxeGU/ibG51pKAWbCmCl2sj/cw61zPjs7g=
Date: Tue, 13 Sep 2022 15:53:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YyCLdCsGouLie1/E@kroah.com>
References: <20220902143715.320500-1-gregkh@linuxfoundation.org>
 <YyCAaaLuT5s1Jhy2@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyCAaaLuT5s1Jhy2@hovoldconsulting.com>
Message-ID-Hash: 6YGGNLZ3IPHKMOXMBTMWGYI5TANAOVGR
X-Message-ID-Hash: 6YGGNLZ3IPHKMOXMBTMWGYI5TANAOVGR
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, stable <stable@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_helper: remove unused and wrong debugfs usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6YGGNLZ3IPHKMOXMBTMWGYI5TANAOVGR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 13, 2022 at 03:06:49PM +0200, Johan Hovold wrote:
> On Fri, Sep 02, 2022 at 04:37:15PM +0200, Greg Kroah-Hartman wrote:
> > In the greybus audio_helper code, the debugfs file for the dapm has the
> > potential to be removed and memory will be leaked.  There is also the
> > very real potential for this code to remove ALL debugfs entries from the
> > system, and it seems like this is what will really happen if this code
> > ever runs.  This all is very wrong as the greybus audio driver did not
> > create this debugfs file, the sound core did and controls the lifespan
> > of it.
> 
> Yeah, this looks very broken indeed.
> 
> > So remove all of the debugfs logic from the audio_helper code as there's
> > no way it could be correct.  If this really is needed, it can come back
> > with a fixup for the incorrect usage of the debugfs_lookup() call which
> > is what caused this to be noticed at all.
> 
> > Cc: Johan Hovold <johan@kernel.org>
> > Cc: Alex Elder <elder@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: greybus-dev@lists.linaro.org
> > Cc: linux-staging@lists.linux.dev
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I know this has already been applied, but still:
> 
> Acked-by: Johan Hovold <johan@kernel.org>

Thanks for the review, much appreciated.

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
