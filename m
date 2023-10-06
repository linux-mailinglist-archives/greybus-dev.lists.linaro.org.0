Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74B7BB8EA
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 15:20:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8A1FD3F23D
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 13:20:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 4332A40C57
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 13:20:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Z0J5LgVg;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 305D9B828DB;
	Fri,  6 Oct 2023 13:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F146C433C9;
	Fri,  6 Oct 2023 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696598408;
	bh=bkjpF90xs9W6T4GDw1pW54wVAZduRqdmSqenrnKSVcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0J5LgVgp4BGBGj1lMOMt+xJoI2Ba4Z7PR4IPip5Yn70+NgGSi1U3CbVMzOICe3C6
	 OWTBOcaLvpI1LOPbT9SWpMjRCsNWYvhjbfpKKiNOdNJ/6UV1DvrAddOMfv3lL2N9/5
	 bs+bsMdo/P4OjncA4lCHgwmI8uZ8KKf2e7fx9B1o=
Date: Fri, 6 Oct 2023 15:20:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Message-ID: <2023100649-oxymoron-entrap-b959@gregkh>
References: <2023100533-broadband-hunk-9e91@gregkh>
 <ZSAHoIN8p2ROXvh/@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZSAHoIN8p2ROXvh/@runicha.com>
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:ams.source.kernel.org];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[ams.source.kernel.org:helo,ams.source.kernel.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4332A40C57
Message-ID-Hash: VFCTL57VGJ6IJZSYH4W36KNX5QI76INF
X-Message-ID-Hash: VFCTL57VGJ6IJZSYH4W36KNX5QI76INF
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/3] staging: greybus: raw: make raw_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VFCTL57VGJ6IJZSYH4W36KNX5QI76INF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 06, 2023 at 06:42:00PM +0530, Deepak R Varma wrote:
> On Thu, Oct 05, 2023 at 03:58:34PM +0200, Greg Kroah-Hartman wrote:
> > Now that the driver core allows for struct class to be in read-only
> 
> Hello Greg,
> When you say "Now", has anything changed recently that facilitates this
> improvement?

Yes.  Well, it showed up in the 6.4 kernel, so not that long ago.

> Where can I read more about this change?

Running:
	git log --oneline --author=gregkh v6.3..v6.4 drivers/base/
will show you the some of work that happened here to make this possible.
There was work done to the driver core, and the kobject core in earlier
kernel releases that the changes in 6.4 built on top of.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
