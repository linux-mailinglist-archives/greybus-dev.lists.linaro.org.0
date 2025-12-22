Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7ECCD4CAD
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Dec 2025 07:23:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6409E400F5
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Dec 2025 06:23:25 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 3A0A73F9D9
	for <greybus-dev@lists.linaro.org>; Mon, 22 Dec 2025 06:23:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=PzUPzYVj;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BB3642A4E;
	Mon, 22 Dec 2025 06:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20322C4CEF1;
	Mon, 22 Dec 2025 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766384600;
	bh=cp4Y4Viq32Tcu/PvRr7OtpD1mzw/G1T4ZluFPnluqvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzUPzYVjVAH6WAkkJbr+ycJigjIYl245pJky2cwK+MCO75BK9kmvUXV5FTET6wsVd
	 or/+tg03AxZQm2u895SbjJpSPU67/3IztKCzhhncxT8KhJDwZEWwRmYumj9hE5RWb2
	 ziXFUIsSoUenwWOzbqxn0JbCHRZVpNYSidUKudqo=
Date: Mon, 22 Dec 2025 07:23:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Khaled Saleh <khaled.saleh.req@gmail.com>
Message-ID: <2025122240-cofounder-nephew-aec2@gregkh>
References: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	BLOCKLISTDE_FAIL(0.00)[172.234.252.31:server fail,100.75.92.58:server fail];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime,sea.source.kernel.org:rdns,sea.source.kernel.org:helo];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3A0A73F9D9
X-Spamd-Bar: /
Message-ID-Hash: UJTSEE6CG7QHEI2CBWKZHRKGYDJ3P3FO
X-Message-ID-Hash: UJTSEE6CG7QHEI2CBWKZHRKGYDJ3P3FO
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: split gb_audio_gb_get_topology() into helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UJTSEE6CG7QHEI2CBWKZHRKGYDJ3P3FO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 21, 2025 at 09:42:00PM +0200, Khaled Saleh wrote:
> From: khaled <khaled.saleh.req@gmail.com>

This, does not match:

> Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>

this.

Please fix up for your next submission of this change.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
