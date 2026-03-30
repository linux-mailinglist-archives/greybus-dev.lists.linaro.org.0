Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNWsASAtymkx6AUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 09:58:24 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293A356CA6
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 09:58:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3374E402F5
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 07:58:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 36213401F3
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 07:58:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bmXfxC6+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8388660121;
	Mon, 30 Mar 2026 07:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B66C4CEF7;
	Mon, 30 Mar 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774857498;
	bh=749QBqlMO8Dn94gF0bdzy5N+4oBU+S+/nsFlx2xVjWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bmXfxC6+q34DQXLZxcWw0d5s+V2y1/vlRKqo5lDbe0t5MxldiJxdnUJ5eBw2pPK5D
	 eosOxr1/MAQrdczDQlgKy+9QyxFOOioh8tCAknHU+zB0pQS3AnavNnuOY3Xma7Kzu1
	 2zj2P91wJoLPWHGuBrGoKO6M42IFOK+d+repmEYI4LGO27kk5ZgaA9HNNNOu5SVSBq
	 b8xuQb09D5OLdSIiLGDNp0vsutiEvn9ptoxs7T90M1qKAv0mFbcmU/AgWf0nxVQmmj
	 7pYD8s80HHz56JawKlySu7Q5/OyT1DPALekmnLyuQoC2rVGjmWHy50pjapNZGy9Nck
	 UMnMtf3f96g0w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w77Vn-00000006igK-364q;
	Mon, 30 Mar 2026 09:58:15 +0200
Date: Mon, 30 Mar 2026 09:58:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Message-ID: <acotF6BuMHzno-XJ@hovoldconsulting.com>
References: <20260330062402.1454-1-hechushiguitu666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260330062402.1454-1-hechushiguitu666@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: AO2427SBTP3VCPWBGUVUOPWED7QSX2JL
X-Message-ID-Hash: AO2427SBTP3VCPWBGUVUOPWED7QSX2JL
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: fix error message for BTN_3 button
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AO2427SBTP3VCPWBGUVUOPWED7QSX2JL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 8293A356CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:24:02PM +0800, Haoyu Lu wrote:
> In gbaudio_init_jack(), when setting SND_JACK_BTN_3 key, the error message
> incorrectly says "Failed to set BTN_0". This should be "Failed to set BTN_3"
> to match the button being configured.

Please wrap your commit messages at 72 columns or so (checkpatch warns).

> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>

Looks correct otherwise, so you can add my 

Reviewed-by: Johan Hovold <johan@kernel.org>

when resending.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
