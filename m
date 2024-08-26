Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9395E81B
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 07:50:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7ED3F44823
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2024 05:50:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 8E2BC40B65
	for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2024 05:50:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=fJ6qKLYL;
	spf=pass (lists.linaro.org: domain of krzk@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=krzk@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76C29A40086;
	Mon, 26 Aug 2024 05:50:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7334DC4AF14;
	Mon, 26 Aug 2024 05:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724651448;
	bh=aLzgLgLWLVzf1iRXKVptENNKfdzYPHBNK3OzoTkhSI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJ6qKLYLJf3P3WLRF4AMdUkfPnjg8WzQNRcjfLrbie8shPl/8kO3v6X2J8sO47V3N
	 7lNYRuys8c1+FEX/ynJl7fjVtvWcbd1Or+JzkyWABOTakkWb7t7hzqALAfClJKuF7o
	 Io/ocNCHGxAQZxrdZITY9peak6h0nh4c9ynv0lqDmIDCqxeMpd61eh5O5YUrMVf1Sd
	 rBOPEI0pyNeNx4/HpDad3DJkWe194cdUoRIrJZnUhGbfCVyxHsaWGKtUjI1EN4gtgO
	 GV326XHi6rGrN+57SWVRzY1T9In8FwNFTugEAwPJ0wcQ+qqepAXLcvs2xcdE1t8UqK
	 RH0kkZ5z8cnTg==
Date: Mon, 26 Aug 2024 07:50:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayush Singh <ayush@beagleboard.org>
Message-ID: <ldgyloxyvdi2ovpkdmbx443qxolfjlufdkuvgbqjzfw6jskcc6@qwdtctmjo26h>
References: <20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org>
X-Rspamd-Action: no action
X-Spamd-Bar: -----
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8E2BC40B65
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: M7SA4VIDHDGKSCVTDSIZK3CXRSNJ7JCD
X-Message-ID-Hash: M7SA4VIDHDGKSCVTDSIZK3CXRSNJ7JCD
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: lorforlinux@beagleboard.org, robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/3] Add Firmware Upload support for beagleplay cc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M7SA4VIDHDGKSCVTDSIZK3CXRSNJ7JCD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 25, 2024 at 10:17:04PM +0530, Ayush Singh wrote:
> Adds support for beagleplay cc1352 co-processor firmware upgrade using
> kernel Firmware Upload API. Uses ROM based bootloader present in
> cc13x2x7 and cc26x2x7 platforms for flashing over UART.
> 
> Communication with the bootloader can be moved out of gb-beagleplay
> driver if required, but I am keeping it here since there are no
> immediate plans to use the on-board cc1352p7 for anything other than
> greybus (BeagleConnect Technology). Additionally, there do not seem to
> any other devices using cc1352p7 or its cousins as a co-processor.
> 
> Bootloader backdoor and reset GPIOs are used to enable cc1352p7 bootloader
> backdoor for flashing. Flashing is skipped in case we are trying to flash
> the same image as the one that is currently present. This is determined by
> CRC32 calculation of the supplied firmware and flash data.
> 
> We also do a CRC32 check after flashing to ensure that the firmware was
> flashed properly.
> 
> Link: https://www.ti.com/lit/ug/swcu192/swcu192.pdf Ti CC1352P7 Technical Specification
> 
> Changes in v3:
> - Spelling fixes in cover letter
> - Add Ack by Rob Herring on Patch 1


Where?

Just use b4 to collect tags.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
