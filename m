Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFBAEF82C
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Jul 2025 14:20:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 867F740F7F
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Jul 2025 12:20:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id BA88040F7F
	for <greybus-dev@lists.linaro.org>; Tue,  1 Jul 2025 12:20:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=coqZTQTK;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 285796143F;
	Tue,  1 Jul 2025 12:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD88FC4CEEB;
	Tue,  1 Jul 2025 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372413;
	bh=Cey/1A5doCD8DkIDA8nHKRd918FyBxWY0j4lxorG6Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coqZTQTKghxbxm/zVcD9m7ei0OQymE8zk/gnuJ6VqEttaDtmLLEQfFFfvZrqP/uZA
	 BSZ52HL48lT68Bp8Wtfoq0iKLYTy2X7I1H0MeTJAYmilWsgS81ZLHrMTBAPeZ6MWtG
	 eZsDforhI1nXO8Wou2SLzfbM2luIytTIw6qmS+vE6PpKXu1E0FCo2p6qErTmXdYh90
	 b/6DhoNIJaTmCYtWzGbHLMoAvE2Q3R0kX2Z0GKAl9wInZZi2C7M3jFX9IBP2RNpqmC
	 qI1s2jPIGJZCoq1xcKWblCc2Sc0a+6q5XtDRiHKKfReLoY+c6I63Pyt+hs/fjaF8KB
	 JoZHKdXorIPIA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uWZy9-000000006I0-1iqk;
	Tue, 01 Jul 2025 14:20:14 +0200
Date: Tue, 1 Jul 2025 14:20:13 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <aGPSfRSTDXsNNp1P@hovoldconsulting.com>
References: <2025070115-reoccupy-showy-e2ad@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025070115-reoccupy-showy-e2ad@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BA88040F7F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[kernel.org:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: WYFQBH6HBN5P2GY4HAVBLLXROFKTZY4A
X-Message-ID-Hash: WYFQBH6HBN5P2GY4HAVBLLXROFKTZY4A
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: gbphy: fix up const issue with the match callback
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WYFQBH6HBN5P2GY4HAVBLLXROFKTZY4A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 01, 2025 at 01:06:16PM +0200, Greg Kroah-Hartman wrote:
> gbphy_dev_match_id() should be taking a const pointer, as the pointer
> passed to it from the container_of() call was const to start with (it
> was accidentally cast away with the call.)  Fix this all up by correctly
> marking the pointer types.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2: - add Fixes: line as pointed out by Johan
>     - don't make gbphy_dev const, it's not needed, as pointed out by
>       Johan

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
