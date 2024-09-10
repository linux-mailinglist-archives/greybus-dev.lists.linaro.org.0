Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AE973CBA
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Sep 2024 17:51:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AFFD14432C
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Sep 2024 15:51:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 8BDE9411F3
	for <greybus-dev@lists.linaro.org>; Tue, 10 Sep 2024 15:51:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=t5N2uiM1;
	spf=pass (lists.linaro.org: domain of horms@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=horms@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88C8E5C04E8;
	Tue, 10 Sep 2024 15:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8C4C4CEC3;
	Tue, 10 Sep 2024 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725983501;
	bh=u+LUaZcmfiXGrPUKUlRbyxCTBqnb4HavaO+FbiBlV+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5N2uiM1pWLNmDd5h0HKWfwfCVjfWQp+9QJG27mYdbRGl83FJ1gt6jlIzDbIyXQt/
	 3DbT41hD7Axa7J4+BrsTqSQSK3vzw4Fb+1WdX+qvLwi0ASBpwsaBQVYOJ3o4nEAaJp
	 EepiZmcfW9AW5CWMQqep36htQQrZiO4vE10Q1QgvyzTLpVSock/X8mdypIc9Dsc7BE
	 1E2/wKRGg3pQqfY87+ge3T24b9BEvcNnyjBCynzBhQdYl7L0kQ+g+f7CMoKOR/7N5h
	 dUkuebKd302kzNgTIs86SGrDrmKLMbZqLmBPZBR/nsKYa94FqEpSZACsrzIfkfaWfG
	 5OZ/TodFS0MEg==
Date: Tue, 10 Sep 2024 16:51:36 +0100
From: Simon Horman <horms@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <20240910155136.GH572255@kernel.org>
References: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
 <20240903-beagleplay_fw_upgrade-v4-3-526fc62204a7@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903-beagleplay_fw_upgrade-v4-3-526fc62204a7@beagleboard.org>
X-Rspamd-Action: no action
X-Spamd-Bar: -
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8BDE9411F3
X-Spamd-Result: default: False [-1.66 / 15.00];
	BAYES_HAM(-2.16)[95.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: CT654MZVZMNYSQVISFDC2WOOY6FFCAVW
X-Message-ID-Hash: CT654MZVZMNYSQVISFDC2WOOY6FFCAVW
X-MailFrom: horms@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: d-gole@ti.com, lorforlinux@beagleboard.org, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 3/3] greybus: gb-beagleplay: Add firmware upload API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CT654MZVZMNYSQVISFDC2WOOY6FFCAVW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 03:02:20PM +0530, Ayush Singh wrote:
> Register with firmware upload API to allow updating firmware on cc1352p7
> without resorting to overlay for using the userspace flasher.
> 
> Communication with the bootloader can be moved out of gb-beagleplay
> driver if required, but I am keeping it here since there are no
> immediate plans to use the on-board cc1352p7 for anything other than
> greybus (BeagleConnect Technology). Additionally, there do not seem to
> any other devices using cc1352p7 or it's cousins as a co-processor.
> 
> Boot and Reset GPIOs are used to enable cc1352p7 bootloader backdoor for
> flashing. The delays while starting bootloader are taken from the
> userspace flasher since the technical specification does not provide
> sufficient information regarding it.
> 
> Flashing is skipped in case we are trying to flash the same
> image as the one that is currently present. This is determined by CRC32
> calculation of the supplied firmware and Flash data.
> 
> We also do a CRC32 check after flashing to ensure that the firmware was
> flashed properly.
> 
> Firmware size should be 704 KB.
> 
> Link: https://www.ti.com/lit/ug/swcu192/swcu192.pdf Ti CC1352p7 Tecnical Specification

nit: If you need to post a v5 for some other reason,
     please consider updating the spelling of Technical

> Link: https://openbeagle.org/beagleconnect/cc1352-flasher Userspace
> Flasher
> 
> Signed-off-by: Ayush Singh <ayush@beagleboard.org>

...
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
