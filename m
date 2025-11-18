Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD38C6A7CE
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 17:04:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D10923F90B
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 16:04:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 85C0F3F777
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 16:04:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="U/LGjl4l";
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E62CF41A54;
	Tue, 18 Nov 2025 16:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF4CC19424;
	Tue, 18 Nov 2025 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481886;
	bh=9gQ9SEgdVfZrxs2j6npxc5eJd5sG7Qxk9CD7h2dDyCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/LGjl4luHFUcMbTm3S9j3hWedu+CTVbTDuoeu+bUXwBiwgBNz74WqL9RYKiMGJNY
	 58fUsrEzVC9IBW7F80F3j53NyGOp3GCMnGUhsMk2mqgN0+mgzIkL0n7iGijM5bo60M
	 swgM8w6BXG8LRUVvA2tuT9djqxUSd81VciFHP2g8vEahY1BkhliEi4b17eg4DmlvAt
	 a3YfLqQRxis9pr9Ek1ma0gJK+JZygDs2mR+ccgDIVu816ZCavPsFcG8HwxDQmBwXdD
	 92rQAFQqdYWIQ00qqzxUkuDVTM61aptw8Ksa9KTmGJBGZWg7IkyXbIWVLVbVLHUdlV
	 rTTCGLbZO9gOQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLOCD-000000003CZ-1Ppa;
	Tue, 18 Nov 2025 17:04:45 +0100
Date: Tue, 18 Nov 2025 17:04:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <aRyZHWVl2jEFgrD1@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-14-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-14-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.73 / 15.00];
	BAYES_HAM(-2.73)[98.81%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
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
	URIBL_BLOCKED(0.00)[sea.source.kernel.org:rdns,sea.source.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 85C0F3F777
X-Spamd-Bar: ---
Message-ID-Hash: 2NHJLWLDUNTNWFHRZ2INTFOG7RPIQJQ3
X-Message-ID-Hash: 2NHJLWLDUNTNWFHRZ2INTFOG7RPIQJQ3
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 13/13] staging: greybus: usb: remove obsolete FIXME about bridged-PHY support
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2NHJLWLDUNTNWFHRZ2INTFOG7RPIQJQ3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:18PM +0530, Ayaan Mirza Baig wrote:
> The USB bridged-PHY protocol has never been supported by the upstream
> USB core and cannot function. Remove the obsolete FIXME and 
> keep the protocol disabled with a straightforward explanatory comment.

Drop this one as well. The comment is not obsolete.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
