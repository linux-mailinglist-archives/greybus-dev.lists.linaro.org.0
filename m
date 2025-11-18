Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F283FC6A779
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 17:01:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BFB53F912
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 16:01:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id D0CD33F777
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 16:01:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=pJSgRcHe;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 453704079B;
	Tue, 18 Nov 2025 16:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE23C2BCB2;
	Tue, 18 Nov 2025 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481674;
	bh=o0uPaJYb2jainUggFeViLacLUYF3OUcC7gOxNTF2NNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJSgRcHe5D3tfHiL3L/sKzDh2ukivMWCyUlshbr1lDRaWp6H97M5dbnOrjLgalVhN
	 GrTNwPgMyLHH5SZqutPUOc1ifsK19FBwOO15C/WABPbeBOk4FeIRKnwm2WPsCDk0yr
	 mKKxm1hqTW0PQO0+LJHcPJF73WQ8U8vw1HP5XvzzaqMZawyoaHtC/VcHGWef6G8FKr
	 fz2vlsafmDytzNXnHghMEv7mr5EgzACrXP7rQV+WElMzKozEmP5rJndRtYQ3YLOqpr
	 H5JLdJ4DwOsFZwb+g0ad5/as6Q18vOKTW4jVwxvt9wO/2mBWHe2J8jUkJ0cWi97PQx
	 0Diq3n0iybYww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLO8m-00000000397-3OZD;
	Tue, 18 Nov 2025 17:01:12 +0100
Date: Tue, 18 Nov 2025 17:01:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <aRyYSMDwXLjGiB91@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-9-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-9-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.89 / 15.00];
	BAYES_HAM(-2.89)[99.54%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[hovoldconsulting.com:mid,sea.source.kernel.org:rdns,sea.source.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D0CD33F777
X-Spamd-Bar: ---
Message-ID-Hash: JOA7WZHIHB5WXEZOBFAOKQH7WYHBOVU3
X-Message-ID-Hash: JOA7WZHIHB5WXEZOBFAOKQH7WYHBOVU3
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 08/13] staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JOA7WZHIHB5WXEZOBFAOKQH7WYHBOVU3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:13PM +0530, Ayaan Mirza Baig wrote:
> A historical FIXME indicated that this autosuspend call could be removed
> once the S2 Loader supported runtime PM. That hardware is no longer
> supported and Greybus runtime PM is stable as-is, so the FIXME is
> obsolete. Remove it and replace it with a descriptive comment.

Just leave the FIXMEs in place.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
