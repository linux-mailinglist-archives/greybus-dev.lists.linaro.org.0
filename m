Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AFCC6A7EF
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 17:06:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 047333F7E1
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 16:06:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id C7ADD3F7E1
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 16:06:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=JYf5LiZt;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DD1A4151B;
	Tue, 18 Nov 2025 16:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9077C19421;
	Tue, 18 Nov 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481974;
	bh=6sq8Dmgfv99Hiy4Kp3kIJ8Z8rxZ2t/2PqKFVCLWt5+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYf5LiZtZpHvsorhZzbdMPpyDZyaH+50EkkY5OOCtx4uNA7z4KzEsgb3uQeA/BeyI
	 J/qZmkJ7Y/68DqchrwkCmxmFOrBGi/g3ePAopqZJuf+cfDXzXdzrwqXpQ8FpvsyECu
	 gQAYQAl7lD+QU1FQvbwPnyjAy+Kis5hGpk636rSTV4ASnCHlKXZsP0jhLTe4BGd1Pg
	 yWAr9yV3nxe+RqfqSgXk8PPObqRXS7mkiPN2KxJkecTOYAkq+ix2XiKt8JX87mf+0o
	 VlKI1SyIG/P7rXgX7/gOlVZr6YVhmywMLOtIPUkmdR8DpQKoIyVY6daOGEyAocJgPg
	 jhz6LPRBMucLw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLODd-000000003Dz-1aBO;
	Tue, 18 Nov 2025 17:06:13 +0100
Date: Tue, 18 Nov 2025 17:06:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <aRyZdZC9yJuZilP_@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-13-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-13-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.15 / 15.00];
	BAYES_HAM(-2.15)[95.94%];
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
X-Rspamd-Queue-Id: C7ADD3F7E1
X-Spamd-Bar: ---
Message-ID-Hash: IIL25ISSYFM7TLCWRKP7KVHO2ZKUCU5V
X-Message-ID-Hash: IIL25ISSYFM7TLCWRKP7KVHO2ZKUCU5V
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 12/13] staging: greybus: usb: validate hub control response length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IIL25ISSYFM7TLCWRKP7KVHO2ZKUCU5V/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:17PM +0530, Ayaan Mirza Baig wrote:
> Clamp hub control wLength to a reasonable maximum before allocating
> the response buffer to avoid oversized allocations and remove the
> FIXME about unspecified lengths.

I don't believe you this is what the comment is about at all. Leave it.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
