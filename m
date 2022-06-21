Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA25534B6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 16:40:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6ED7F3F2C8
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jun 2022 14:40:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 9BC513F0CB
	for <greybus-dev@lists.linaro.org>; Tue, 21 Jun 2022 14:40:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B481616B0;
	Tue, 21 Jun 2022 14:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CE7C341C0;
	Tue, 21 Jun 2022 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655822442;
	bh=w320+wuqbFHvuGQ3W4guubYrnJKxDF19Xrl56Eu3yHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RutlupmvxTM2WBwYvITX5xNCm/wKJpI1hJPG0OmWn1IjpLSP9S5Iipo8ivtuNZa4N
	 SREWd6vu3fuliQ3quyD4ngv9hfRsSPJwe7og85nudLkf5uosLDZU/FDofT/Ih0DpdQ
	 qO5Nm12xtVGTxffcoEdNz/BVAmwvl5ZbrD9R/2ZgXQtrqO+4IrCESYxy3aPR0922bF
	 LfunBWPeels2/RJolz24Xc2RHqsK8Ep/RJqsuV3XNyah0Imp31NC/FUBAdAml2QYfd
	 JSMEvt3F77KtVcXwjB+pj6MS8gprWfJjbUBfGB6O63rqbtTPYfCctPYcJ3LBB6Z6Nb
	 Xf9pQZO9CTIwg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1o3f3V-00078B-8q; Tue, 21 Jun 2022 16:40:37 +0200
Date: Tue, 21 Jun 2022 16:40:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Message-ID: <YrHYZb2BT8fQMcaR@hovoldconsulting.com>
References: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD-N9QVVKUDFKMSxUc-smcz0B_7PrjN3DPku+cDM3ZKDn0XLBA@mail.gmail.com>
Message-ID-Hash: IVNZAXKRNHWYM3ISLFSUDX3RJYF6G5L6
X-Message-ID-Hash: IVNZAXKRNHWYM3ISLFSUDX3RJYF6G5L6
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Unitialized Variable and Null Pointer Dereference bug in gb_bootrom_get_firmware
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IVNZAXKRNHWYM3ISLFSUDX3RJYF6G5L6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 21, 2022 at 10:36:04PM +0800, Dongliang Mu wrote:
> Hi maintainers,
> 
> I would like to send one bug report.
> 
> In gb_bootrom_get_firmware, if the first branch is satisfied, it will
> go to queue_work, leading to the dereference of uninitialized const
> variable "fw". If the second branch is satisfied, it will go to unlock
> with fw as NULL pointer, leading to a NULL Pointer Dereference.

This sounds like the false positive that checkers keep tripping over.

Please double check your analysis and search the archives first.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
