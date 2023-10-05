Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3D7BA304
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 17:50:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CFAC3F94C
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 15:50:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 01A7D3F94C
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 15:50:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=VSN4m25c;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F2228B82552;
	Thu,  5 Oct 2023 15:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D146C433C8;
	Thu,  5 Oct 2023 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696521047;
	bh=1aXKNsvGURh4L9T8WGFdA+ZIToURAZxeUT/05vEWaGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSN4m25cCRn0BzAiJYOMhg7WW6wdT+WR7sHQ3Kg2hsNBJqn3PC4fCcqKAphAg4zaN
	 g5mkH1WGWvFgXij0AY90JnjR2ac2064NslL+4tsCJOCv/9caFXoECUg8MHjeYlCVey
	 bEnHsA1rwwmzLEKdkETqdi+n7pDnrBolx0zoue+FDgeUrFFa+AS4HDV/3IQwz+nefL
	 Lmhaqo2W+4yrMF6D0/VCcTYpSt6shN0CcreHdIe+dkZmIWoOxH8vGcyyk1njw+Ce8w
	 w8onggZobPdN2T/Oqd7pHotg19Waf6zklGh+YVyF/I+FuSsLua0YG3TmRg8wl5kh+6
	 Ku59kEjbRWUTg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qoQcy-0004cn-0l;
	Thu, 05 Oct 2023 17:51:04 +0200
Date: Thu, 5 Oct 2023 17:51:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZR7baCUNIrJzJQ05@hovoldconsulting.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
 <2023100534-catty-moodiness-099e@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023100534-catty-moodiness-099e@gregkh>
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:ams.source.kernel.org:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.68.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 01A7D3F94C
Message-ID-Hash: 6BJT2662OL2YCB4NOMXBVNWT6UT2UYQZ
X-Message-ID-Hash: 6BJT2662OL2YCB4NOMXBVNWT6UT2UYQZ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/3] staging: greybus: fw-management: make fw_mgmt_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6BJT2662OL2YCB4NOMXBVNWT6UT2UYQZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 05, 2023 at 03:58:36PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
