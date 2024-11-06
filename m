Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F929BF053
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 15:30:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8CFFA40B65
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 14:30:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 216BD40A8E
	for <greybus-dev@lists.linaro.org>; Wed,  6 Nov 2024 14:30:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ZzfAdHFt;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 042CB5C57EA;
	Wed,  6 Nov 2024 14:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1BCC4CECC;
	Wed,  6 Nov 2024 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730903450;
	bh=n6K8US+dgiUl2jqiZqxsPy7aq61LHMhzpmauz2R5f2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzfAdHFtZTdTeCXeIadJi25bnASD9CtX5EjaA6tB4FMLAf0qfIpIfeCt9mXOUBpFh
	 C+VSWGCjtNvV6+chSSjbjh/NkavmIdgE8IABQ8Ifbn5XzAaFrCli8p57Ho52H9ZlzM
	 kbNaSeIloz/O1J2xWzcvsQKznus9bjZwb42vFmlMJoOTYg5RK5ipeQHtvdAgfo9eyw
	 WP3riFy1BBL4rXSZcNfGXWnsVwG9Nv43210iZb0d9LsifxEdVkilX64hrkce0k6gR2
	 yzrH5Q5iW+9gMwLdFgINWKxjELEQr8X9fXqgbZN9nU28OtkMmreT1bvaUQi1/rDk9a
	 EvZ29xZ6Q1+bg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t8h3Z-000000005cC-29Ym;
	Wed, 06 Nov 2024 15:30:50 +0100
Date: Wed, 6 Nov 2024 15:30:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Message-ID: <Zyt9mf-6hNYWyNhJ@hovoldconsulting.com>
References: <20241106095819.15194-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Spamd-Result: default: False [-9.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[139.178.84.217:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 216BD40A8E
X-Spamd-Bar: --------
Message-ID-Hash: CLG2HRLXFKKAJU2U3ZSLFUDMQ527Q6TW
X-Message-ID-Hash: CLG2HRLXFKKAJU2U3ZSLFUDMQ527Q6TW
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CLG2HRLXFKKAJU2U3ZSLFUDMQ527Q6TW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 06, 2024 at 05:58:19PM +0800, Qiu-ji Chen wrote:
> Our static checker found a bug where set_serial_info() uses a mutex, but 
> get_serial_info() does not. Fortunately, the impact of this is relatively 
> minor. It doesn't cause a crash or any other serious issues. However, if a 
> race condition occurs between set_serial_info() and get_serial_info(), 
> there is a chance that the data returned by get_serial_info() will be 
> meaningless.
> 
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
> ---
> V2:
> Modified the patch description to make it more concise and easier to understand.
> Changed the fix code to ensure the logic is correct.
> Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.

Much better, thanks.

But please try to use the same patch prefix as previous patches for the
driver you're modifying (e.g. by looking at git log --oneline for the
driver in question).

In this case it should have been:

	staging: greybus: uart: fix ...

so that it's clear where this patch should be applied.

Care to fix that up in a v3?

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
