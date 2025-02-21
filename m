Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B93A3F42D
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Feb 2025 13:25:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9AB6844A26
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Feb 2025 12:25:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 12B983F664
	for <greybus-dev@lists.linaro.org>; Fri, 21 Feb 2025 12:25:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ke4222DD;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5816B61250;
	Fri, 21 Feb 2025 12:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC81C4CEE7;
	Fri, 21 Feb 2025 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740140744;
	bh=OFSEtxcK3zYlx7wBQWYTU3fDwOhj2h7jl/iYHctMRmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ke4222DDHXnV0BAbawEdjTedKJ53iUBQi58weupuZmzWnCssmhDzQgg9Q0enJakXY
	 HgD4I+pW236g5wFFCtm1hSAHBp9jRkAsbJxATshxB47DfW+nr3lkX2vP6oJ9ROT3yh
	 +1YsaS7vHjHwvlGdqbzJ2nRWHTM7nm8rL9mqK2ZwZOwG3vQuAqVWCTlnuTRPEF9ZPi
	 Db7/ybs1r4+JQZxQ22oYXEnkrTcJeIqo9EE6M7bCqFMqxMjgzQRXXZSoiWX/Qr/0KS
	 9B11aksKwgNWpyz72jowA9XhJIgeGpUkghRHoQtfszbG8NfLynGOwPsjqgSVvBEl0K
	 8faQp5KXhN0xQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tlS6M-000000007ms-3Dz0;
	Fri, 21 Feb 2025 13:25:55 +0100
Date: Fri, 21 Feb 2025 13:25:54 +0100
From: Johan Hovold <johan@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <Z7hw0lO1bGEesy_d@hovoldconsulting.com>
References: <20250220111606.138045-1-jirislaby@kernel.org>
 <20250220111606.138045-22-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250220111606.138045-22-jirislaby@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 12B983F664
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.90 / 15.00];
	BAYES_HAM(-2.90)[99.58%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[172.105.4.254:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,kernel.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: OFPXEOM2P36YWD4UPA3BKODYMXJCTXFG
X-Message-ID-Hash: OFPXEOM2P36YWD4UPA3BKODYMXJCTXFG
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, David Lin <dtwlin@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 21/29] tty: staging/greybus: pass tty_driver flags to tty_alloc_driver()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OFPXEOM2P36YWD4UPA3BKODYMXJCTXFG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 20, 2025 at 12:15:58PM +0100, Jiri Slaby wrote:
> tty_alloc_driver() is supposed to receive tty driver flags.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Acked-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
