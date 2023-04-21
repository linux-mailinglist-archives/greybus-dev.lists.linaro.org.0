Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80B6EA3D3
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Apr 2023 08:29:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB94B3EE47
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Apr 2023 06:29:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 513CB3EC16
	for <greybus-dev@lists.linaro.org>; Fri, 21 Apr 2023 06:28:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=SGjhVfix;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C62F264DFA;
	Fri, 21 Apr 2023 06:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A3AC433EF;
	Fri, 21 Apr 2023 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682058535;
	bh=fDzyTwqwYy1p3E1HPlBerUNEVhCJC25uaFNzEjHZIpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SGjhVfixPmGjuaAJVvku0cH3xNGa38Gx0ysu7qeDMkzf7dJ1rGglsr0vKFF2BpHqT
	 GPgAZwgmY6v6+sekGp8RoiP5A5IZQgTg68avEKyX06/daqD+xvRmRHV9SANnXofIbg
	 XLKgHXj8z4HiPXKw4t11dg7XWgRwMXph6ER1SmqEGPS76CNgYV39aapQZntVbMJSpv
	 1pqRqcrQzR2tm4EsOigXsoOIpUk1aVQi1+0YjG17t949/efhcVUHLtuW788Hwo2tjE
	 h+FVTzbVyS1DitCtuTXnLvkfm82ugcNhO29085r18rC7vGkNr3ORCUcn3z52CzOJd7
	 +iOcbApRk332w==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1ppkGc-000659-JO; Fri, 21 Apr 2023 08:29:11 +0200
Date: Fri, 21 Apr 2023 08:29:10 +0200
From: Johan Hovold <johan@kernel.org>
To: Tejun Heo <tj@kernel.org>
Message-ID: <ZEItNlmuw5MHDBXH@hovoldconsulting.com>
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-3-tj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421025046.4008499-3-tj@kernel.org>
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,meta.com,kernel.org,linuxfoundation.org,lists.linaro.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 513CB3EC16
X-Spamd-Bar: --------
Message-ID-Hash: VMEEOB24BL6ZSMS5G3ZUEK44FNL54U6V
X-Message-ID-Hash: VMEEOB24BL6ZSMS5G3ZUEK44FNL54U6V
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: jiangshanlai@gmail.com, linux-kernel@vger.kernel.org, kernel-team@meta.com, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 02/22] greybus: Use alloc_ordered_workqueue() to create ordered workqueues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VMEEOB24BL6ZSMS5G3ZUEK44FNL54U6V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 20, 2023 at 04:50:26PM -1000, Tejun Heo wrote:
> BACKGROUND
> ==========
> 
> When multiple work items are queued to a workqueue, their execution order
> doesn't match the queueing order. They may get executed in any order and
> simultaneously. When fully serialized execution - one by one in the queueing
> order - is needed, an ordered workqueue should be used which can be created
> with alloc_ordered_workqueue().

> This patch series audits all callsites that create an UNBOUND workqueue w/
> @max_active==1 and converts them to alloc_ordered_workqueue() as necessary.
> 
> WHAT TO LOOK FOR
> ================
> 
> The conversions are from
> 
>   alloc_workqueue(WQ_UNBOUND | flags, 1, args..)
> 
> to
> 
>   alloc_ordered_workqueue(flags, args...)
> 
> which don't cause any functional changes. If you know that fully ordered
> execution is not ncessary, please let me know. I'll drop the conversion and
> instead add a comment noting the fact to reduce confusion while conversion
> is in progress.
> 
> If you aren't fully sure, it's completely fine to let the conversion
> through. The behavior will stay exactly the same and we can always
> reconsider later.
> 
> As there are follow-up workqueue core changes, I'd really appreciate if the
> patch can be routed through the workqueue tree w/ your acks. Thanks.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: greybus-dev@lists.linaro.org

Acked-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
