Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C62D1961F
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 15:19:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 82F6F3F6FF
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Jan 2026 14:19:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
From: marco.crivellari@suse.com
To: greybus-dev@lists.linaro.org
Message-ID: <20260113135737.190636-1-marco.crivellari@suse.com>
X-Mailman-Approved-At: Tue, 13 Jan 2026 14:19:15 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add WQ_PERCPU to alloc_workqueue users
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/C3PQ4Z5DABHQ2K75CXQIOGA5PMYQQMOY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Jan 2026 14:19:16 +0000 (UTC)

The content of this message was lost. It was probably cross-posted to
multiple lists and previously handled on another list.
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
