Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 85680545DFA
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 10:00:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B92CC3F4D3
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 08:00:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 383373EEB7
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jun 2022 08:00:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 371FAB832A2;
	Fri, 10 Jun 2022 08:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F7EC34114;
	Fri, 10 Jun 2022 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654848007;
	bh=rIT5rAC8mwzXd9v1qd5sMTexcVFRTr1GesOWEmu8Wws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlboDRo98OjDCefRGijDSqyZu7a2wKmNKeEnhW+cI+cMmkEE6RgZNNAnU5TOFmfIc
	 jwzf7MWHPPgDnaCdjFYYFeYAdLYk2v9rgR9Vn9lKvjtPQolynd4xvlcs0ZBjEf1H/o
	 VrEt0MefzpYq/3FUjrv4m8Caarr38QtaJAY4K8Bv28Oa2QecvGQQF4ZHETYzqZyZpK
	 2Mf5AzjRKPNrfSUidqV3ditTaEw2f3QeOKGBuAsJXrFxOx9rafaPRjZgQNjZgv1441
	 ojFokEBHAwMMClKbeEu/BwwQh805gIKgqojUjpfCk4i3F+QGlySpH/ErdwPmIGJTZA
	 dkgjoHtpzc3Xw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nzZYp-0004yN-83; Fri, 10 Jun 2022 10:00:03 +0200
Date: Fri, 10 Jun 2022 10:00:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Jared Kangas <kangas.jd@gmail.com>
Message-ID: <YqL6A3pVC8LOqE4d@hovoldconsulting.com>
References: <20220609214517.85661-1-kangas.jd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609214517.85661-1-kangas.jd@gmail.com>
Message-ID-Hash: NIFT6DWGQAZLIZN7Y6N5MVB37VJFGMMA
X-Message-ID-Hash: NIFT6DWGQAZLIZN7Y6N5MVB37VJFGMMA
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-staging@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NIFT6DWGQAZLIZN7Y6N5MVB37VJFGMMA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 09, 2022 at 02:45:18PM -0700, Jared Kangas wrote:
> gbaudio_dapm_free_controls() iterates over widgets using the
> list_for_each_entry*() family of macros from <linux/list.h>, which
> leaves the loop cursor pointing to a meaningless structure if it
> completes a traversal of the list. The cursor was set to NULL at the end
> of the loop body, but would be overwritten by the final loop cursor
> update.
> 
> Because of this behavior, the widget could be non-null after the loop
> even if the widget wasn't found, and the cleanup logic would treat the
> pointer as a valid widget to free.
> 
> To fix this, introduce a temporary variable to act as the loop cursor
> and copy it to a variable that can be accessed after the loop finishes.
> Due to not removing any list elements, use list_for_each_entry() instead
> of list_for_each_entry_safe() in the revised loop.
> 
> This was detected with the help of Coccinelle.
> 
> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> Cc: stable@vger.kernel.org
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
> ---
> 
> Changes since v1:
>  * Removed safe list iteration as suggested by Johan Hovold <johan@kernel.org>
>  * Updated patch changelog to explain the list iteration change
>  * Added tags to changelog based on feedback (Cc:, Fixes:, Reviewed-by:)

Apparently Greg applied this to staging-next before we had a change to
look at it. You should have received a notification from Greg when he
did so.

	https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=80c968a04a381dc0e690960c60ffd6b6aee7e157

It seems unlikely that this would cause any issues in real life, but
there's still a chance it will be picked up by the stable team despite
the lack of a CC stable tag.

I've just sent a follow-up patch to replace the list macro.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
