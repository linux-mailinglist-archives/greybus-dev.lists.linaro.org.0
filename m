Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FD9768B9B
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 08:12:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78B5543CCB
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 06:12:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 2D0F93EBB0
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jul 2023 06:12:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=C8Q1DaiH;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2FCF60A0B;
	Mon, 31 Jul 2023 06:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80D7C433C8;
	Mon, 31 Jul 2023 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1690783966;
	bh=+pFxdW/bqr3rAfwCoMJgz+bntEMQAT5bPUQoAWoOBkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8Q1DaiHiHcm/dcmA1TZ/Mb3NoAC3qBlgMfP6w7HcMN4BbCoObLYQnxWxN2N72omQ
	 bTNKd1alxJWOCcA1n+2d0WBMczWDFfJ1him5bDCsj7c5yUuOVFBQo0lcUi8Cf54CPH
	 zg/tq3Q/hjSqRyS++y1e3LNf9Q8+H6wp5fhowdK0=
Date: Mon, 31 Jul 2023 08:12:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023073154-geometry-stumbling-f22c@gregkh>
References: <2023073032-hasty-crease-683a@gregkh>
 <20230730194752.32042-1-ayushdevel1325@gmail.com>
 <20230730194752.32042-2-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230730194752.32042-2-ayushdevel1325@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2D0F93EBB0
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: 7JF3B7L4E2DUE4UMIEW7PLRMYFZOFRJ5
X-Message-ID-Hash: 7JF3B7L4E2DUE4UMIEW7PLRMYFZOFRJ5
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: es2: Remove extra newline
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7JF3B7L4E2DUE4UMIEW7PLRMYFZOFRJ5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 31, 2023 at 01:17:52AM +0530, Ayush Singh wrote:
> This patch removes some blank lines in order to fix a checkpatch issue.

No it did not :(

If you wish to learn how to send a proper patch, please work in the
drivers/staging/ portion of the kernel, as that's the recommended place
for this.

good luck!

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
